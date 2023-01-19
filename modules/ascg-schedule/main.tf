resource "aws_autoscaling_schedule" "ascg_schedule" {
  scheduled_action_name = var.schedule_name
  
  desired_capacity = var.desired_capacity
  min_size = var.min_size
  max_size = var.max_size
  recurrence = var.recurrence
  #recurrence : 반복 주기

  autoscaling_group_name = var.ascg_name
}