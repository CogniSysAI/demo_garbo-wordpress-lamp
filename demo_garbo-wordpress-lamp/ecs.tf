resource "aws_ecs_cluster" "lamp_stack_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "lamp_stack_task" {
  family                   = "lamp_stack"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions    = jsonencode([
    {
      name      = "apache",
      image     = "httpd:latest",
      cpu       = 256,
      memory    = 512,
      essential = true,
      portMappings = [
        {
          containerPort = 80,
          hostPort      = 80
        }
      ],
      environment = [
        {
          name  = "MYSQL_ROOT_PASSWORD",
          value = "yourpassword"
        }
      ]
    },
    {
      name      = "mysql",
      image     = "mysql:5.7",
      cpu       = 256,
      memory    = 512,
      essential = true,
      environment = [
        {
          name  = "MYSQL_ROOT_PASSWORD",
          value = "yourpassword"
        }
      ]
    },
    {
      name      = "php",
      image     = "php:7.4-apache",
      cpu       = 256,
      memory    = 512,
      essential = true,
      volumesFrom = [
        {
          sourceContainer = "apache"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "lamp_stack_service" {
  name            = "lamp_stack_service"
  cluster         = aws_ecs_cluster.lamp_stack_cluster.id
  task_definition = aws_ecs_task_definition.lamp_stack_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.lamp_stack_tg.arn
    container_name   = "apache"
    container_port   = 80
  }

  depends_on = [
    aws_lb_listener.lamp_stack_listener
  ]
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_lb_target_group" "lamp_stack_tg" {
  name     = "lamp-stack-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "lamp_stack_listener" {
  load_balancer_arn = var.lb_arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lamp_stack_tg.arn
  }
}

variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "LAMP_Stack_Cluster"
}

variable "subnets" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
  default     = []
}

variable "security_groups" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "The VPC ID where resources will be deployed"
  type        = string
}

variable "lb_arn" {
  description = "The ARN of the load balancer"
  type        = string
}
