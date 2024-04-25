## docs/USAGE.md

# 使用指南

欢迎使用连接车辆平台。本文档将指导您如何使用部署后的应用程序和基础设施。

## 开始之前

在开始之前，请确保您已经按照 `README.md` 中的指南完成了基础设施和应用程序的部署。

## 访问应用程序

部署完成后，您可以通过以下步骤访问和使用应用程序：

1. **访问 Web 服务器**：使用 Terraform 输出的 EC2 实例公有 IP 地址访问 Web 服务器。您可以通过运行以下 Terraform 命令来获取 IP 地址：

    ```sh
    terraform output ec2_instance_id
    ```

2. **使用应用程序**：在 Web 浏览器中输入上一步获取的 IP 地址，即可访问应用程序的主页。

## 管理基础设施

您可以使用 Terraform 和 Ansible 管理和更新基础设施及应用程序：

- **更新基础设施**：若需更新 AWS 资源（如 EC2 实例类型），您可以修改 `variables.tf` 文件中相应的变量值，然后运行以下命令应用更改：

    ```sh
    terraform apply
    ```

- **部署更新**：若应用程序代码或配置有更新，您可以通过 Ansible 重新部署。确保更新了 Ansible 角色或 playbook 后，运行以下命令：

    ```sh
    ansible-playbook playbook.yml
    ```

## 安全最佳实践

请遵循 `docs/SECURITY.md` 中的指导原则，确保您的基础设施和应用程序保持安全。

## 故障排除

遇到问题时，请首先检查 `ansible.log` 和 Terraform 的输出，以确定问题所在。您也可以参考 AWS 控制台中的日志和监控服务。

## 支持

如果您需要进一步的帮助，请查阅项目的 `README.md` 文件获取联系方式。

感谢您使用连接车辆平台。


    
