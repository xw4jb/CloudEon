#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

server:
  port: ${conf["seatunnel.web.port"]}

spring:
  application:
    name: seatunnel
  jackson:
    date-format: yyyy-MM-dd HH:mm:ss
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://${conf["MysqlHostname"]}:${conf["MysqlPort"]}/seatunnel?useSSL=false&useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&allowPublicKeyRetrieval=true
    username: ${conf["MysqlUserName"]}
    password: ${conf["MysqlPassword"]}
  mvc:
    pathmatch:
      matching-strategy: ant_path_matcher

jwt:
  expireTime: 86400
  # please add key when deploy
  # 需确保至少为32字节
  secretKey: ${conf['jwt.secret.key']!"cloudeoncloudeoncloudeoncloudeon"}
  algorithm: HS256

---
spring:
  config:
    activate:
      on-profile: h2
  sql:
    init:
      schema-locations: classpath*:script/seatunnel_server_h2.sql
  datasource:
    driver-class-name: org.h2.Driver
    url: jdbc:h2:mem:seatunnel;MODE=MySQL;DB_CLOSE_DELAY=-1;DATABASE_TO_LOWER=true
    username: sa
    password: sa
  h2:
    console:
      enabled: true
      path: /h2
      settings:
        trace: false
        web-allow-others: false