CREATE TABLE `alarm_item` (
`id`  bigint NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) NULL COMMENT '报警项名称' ,
`group`  varchar(50) NULL COMMENT '报警项组名称' ,
`mode`  int NULL COMMENT '报警方式（1:瞬时报警, 2:周期报警, 3:累计报警）' ,
`targets`  varchar(500) NULL COMMENT '报警监控目标（可多个，分隔）' ,
`metrics`  varchar(500) NULL COMMENT '报警监控指标（可多个，分隔）' ,
`rule_scirpt`  text NULL COMMENT '报警规则脚本' ,
`interval`  int NULL COMMENT '报警任务调度周期（以秒为单位）' ,
`status`  char(1) NULL COMMENT '运行时状态（N:新建, R:运行中, P:暂停, T:终止）' ,
`disabled`  tinyint NULL DEFAULT 0 COMMENT '是否可用（0可用，1禁用）' ,
`receiver`  varchar(255) NULL COMMENT '报警接收者(可多个，分隔)' ,
`receiver_phone`  varchar(255) NULL COMMENT '报警接收者电话（可多个，分隔）' ,
`receiver_mail`  varchar(255) NULL COMMENT '报警接收者邮箱（可多个，分隔）' ,
`send_template`  text NULL COMMENT '报警模版' ,
`send_type`  int NULL COMMENT '报警方式（1:邮件, 2:短信, 3:邮件和短信）' ,
`start_time`  timestamp NULL COMMENT '报警任务开始执行时间' ,
`last_run_time`  timestamp NULL COMMENT '报警任务最近一次执行时间' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 
COMMENT='报警项定义表'
;

CREATE TABLE `alram_record` (
`id`  bigint NOT NULL ,
`alarm_item_id`  bigint NULL COMMENT '报警项ID' ,
`alarm_values`  varchar(500) NULL COMMENT '报警指标值（可多个，分隔且按规则脚本占位顺序排列）' ,
`alarm_time`  timestamp NULL COMMENT '报警发生时间' ,
`start_time`  timestamp NULL COMMENT '报警监控开始时间' ,
`end_time`  timestamp NULL COMMENT '报警监控结束时间' ,
`status`  char(1) NULL COMMENT '状态（N:新建, D:发送中, S:发送成功, F:发送失败, E:发送异常, R:重试）' ,
`create_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`update_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 
COMMENT='报警记录表'
;

