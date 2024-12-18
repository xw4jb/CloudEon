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
spring:
  application:
    name: master-server
  profiles:
    active: postgresql
  banner:
    charset: UTF-8
  jackson:
    time-zone: UTC
    date-format: "yyyy-MM-dd HH:mm:ss"
  datasource:
    driver-class-name: org.postgresql.Driver
    url: jdbc:postgresql://127.0.0.1:5432/dolphinscheduler
    username: root
    password: root
    hikari:
      connection-test-query: select 1
      pool-name: DolphinScheduler
  quartz:
    job-store-type: jdbc
    jdbc:
      initialize-schema: never
    properties:
      org.quartz.threadPool.threadPriority: 5
      org.quartz.jobStore.isClustered: true
      org.quartz.jobStore.class: org.springframework.scheduling.quartz.LocalDataSourceJobStore
      org.quartz.scheduler.instanceId: AUTO
      org.quartz.jobStore.tablePrefix: QRTZ_
      org.quartz.jobStore.acquireTriggersWithinLock: true
      org.quartz.scheduler.instanceName: DolphinScheduler
      org.quartz.threadPool.class: org.quartz.simpl.SimpleThreadPool
      org.quartz.jobStore.useProperties: false
      org.quartz.threadPool.makeThreadsDaemons: true
      org.quartz.threadPool.threadCount: 25
      org.quartz.jobStore.misfireThreshold: 60000
      org.quartz.scheduler.batchTriggerAcquisitionMaxCount: 1
      org.quartz.scheduler.makeSchedulerThreadDaemon: true
      org.quartz.jobStore.driverDelegateClass: org.quartz.impl.jdbcjobstore.PostgreSQLDelegate
      org.quartz.jobStore.clusterCheckinInterval: 5000
  cloud.discovery.client.composite-indicator.enabled: false

# Mybatis-plus configuration, you don't need to change it
mybatis-plus:
  mapper-locations: classpath:org/apache/dolphinscheduler/dao/mapper/*Mapper.xml
  type-aliases-package: org.apache.dolphinscheduler.dao.entity
  configuration:
    cache-enabled: false
    call-setters-on-nulls: true
    map-underscore-to-camel-case: true
    jdbc-type-for-null: NULL
  global-config:
    db-config:
      id-type: auto
    banner: false


registry:
  type: zookeeper
  zookeeper:
    namespace: dolphinscheduler
    connect-string: ${r"${REGISTRY_ZOOKEEPER_CONNECT_STRING}"}
    retry-policy:
      base-sleep-time: 60ms
      max-sleep: 300ms
      max-retries: 5
    session-timeout: 30s
    connection-timeout: 9s
    block-until-connected: 600ms
    digest: ~

master:
  listen-port: ${conf['master.server.listen.port']}
  # master prepare execute thread number to limit handle commands in parallel
  pre-exec-threads: 10
  # master execute thread number to limit process instances in parallel
  exec-threads: 100
  # master dispatch task number per batch, if all the tasks dispatch failed in a batch, will sleep 1s.
  dispatch-task-number: 3
  # master host selector to select a suitable worker, default value: LowerWeight. Optional values include random, round_robin, lower_weight
  host-selector: lower_weight
  # master heartbeat interval
  max-heartbeat-interval: 10s
  # master commit task retry times
  task-commit-retry-times: 5
  # master commit task interval
  task-commit-interval: 1s
  state-wheel-interval: 5s
  server-load-protection:
    # If set true, will open master overload protection
    enabled: true
    # Master max system cpu usage, when the master's system cpu usage is smaller then this value, master server can execute workflow.
    max-system-cpu-usage-percentage-thresholds: 0.7
    # Master max jvm cpu usage, when the master's jvm cpu usage is smaller then this value, master server can execute workflow.
    max-jvm-cpu-usage-percentage-thresholds: 0.7
    # Master max System memory usage , when the master's system memory usage is smaller then this value, master server can execute workflow.
    max-system-memory-usage-percentage-thresholds: 0.7
    # Master max disk usage , when the master's disk usage is smaller then this value, master server can execute workflow.
    max-disk-usage-percentage-thresholds: 0.7
  # failover interval, the unit is minute
  failover-interval: 10m
  # kill yarn / k8s application when failover taskInstance, default true
  kill-application-when-task-failover: true
  registry-disconnect-strategy:
    # The disconnect strategy: stop, waiting
    strategy: waiting
    # The max waiting time to reconnect to registry if you set the strategy to waiting
    max-waiting-time: 100s
  worker-group-refresh-interval: 10s
  command-fetch-strategy:
    type: ID_SLOT_BASED
    config:
      # The incremental id step
      id-step: 1
      # master fetch command num
      fetch-size: 10

server:
  port: ${conf['master.server.port']}

management:
  endpoints:
    web:
      exposure:
        include: health,metrics,prometheus
  endpoint:
    health:
      enabled: true
      show-details: always
  health:
    db:
      enabled: true
    defaults:
      enabled: false
  metrics:
    tags:
      application: ${r"${spring.application.name}"}

metrics:
  enabled: true

# Override by profile

---
spring:
  config:
    activate:
      on-profile: mysql
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: ${conf['jdbc.mysql.address']}
    username: ${conf['jdbc.mysql.username']}
    password: ${conf['jdbc.mysql.password']}
  quartz:
    properties:
      org.quartz.jobStore.driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate