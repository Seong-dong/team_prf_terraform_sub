resource "aws_launch_configuration" "as_conf" {
    # name          = "${var.cluster_name}-web-config"
    image_id      = var.ami_id
    instance_type = var.instance_type
    security_groups = var.sg_ids
    key_name = var.key_name
    #default scripts
    user_data = var.user_data    
    
    # 시작 구성을 변경했을때, 시작구성정보가 바뀌면 오류가 남.
    # 오류를 방지하려면
    # lifecycle을 넣어서 생성 후 삭제되게 해야함
    
    lifecycle{
        create_before_destroy = true
    }

}