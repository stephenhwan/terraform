#Package manager for linux

$ wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

$ sudo apt update && sudo apt install terraform

#learn basic terraform

https://viblo.asia/p/terraform-series-bai-1-infrastructure-as-code-va-terraform-maGK7Bqa5j2

#resouce terraform

https://registry.terraform.io/

# lưu í role 
-tạo role 
+create role
+add permission
-add permission 
+AmazonEC2FullAccess
+AmazonSSMManagedInstanceCore
+ec2-runinstance(custome)

#json ec2-runinstance
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": "*"
        }
    ]


terraform command
- mkdir file
- cd file
- nano terraform.tf
#Bước này được sử dụng để khởi tạo môi trường Terraform. Nó sẽ tải về các plugin và module cần thiết, cấu hình thiết bị lưu trữ và thiết lập các biến môi trường.
- terraform init 
#Sau khi khởi tạo thành công, ta có thể thực hiện bước tiếp theo là terraform plan. Bước này sẽ kiểm tra các tài nguyên đã được định nghĩa trong file cấu hình của người dùng và so sánh chúng với trạng thái hiện tại của đám mây để xác định các thay đổi cần áp dụng.
-terraform plan
#Khi ta đã chắc chắn về các thay đổi cần áp dụng, ta có thể thực hiện bước terraform apply để triển khai các tài nguyên mới hoặc cập nhật các tài nguyên đã có. Bước này sẽ tạo ra các yêu cầu API cần thiết đến nền tảng đám mây để thay đổi cấu hình của hạ tầng.
-terraform apply -auto-approve
-terraform destroy -auto-approve

