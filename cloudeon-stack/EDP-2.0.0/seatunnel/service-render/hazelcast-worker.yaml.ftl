#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
hazelcast:
  cluster-name:  ${conf['seatunnel.cluster.name']}
  network:
    rest-api:
      enabled: true
      endpoint-groups:
        CLUSTER_WRITE:
          enabled: true
        DATA:
          enabled: true
    join:
      tcp-ip:
        enabled: true
        member-list:
        <#list serviceRoles['SEATUNNEL_MASTER'] as master>
          - ${master.hostname}:${conf['seatunnel.master.join.port']}
        </#list>
    port:
      auto-increment: false
      port: ${conf['seatunnel.worker.join.port']}
  properties:
    hazelcast.invocation.max.retry.count: 20
    hazelcast.tcp.join.port.try.count: 30
    hazelcast.logging.type: log4j2
    hazelcast.operation.generic.thread.count: 50
    hazelcast.heartbeat.failuredetector.type: phi-accrual
    hazelcast.heartbeat.interval.seconds: 2
    hazelcast.max.no.heartbeat.seconds: 180
    hazelcast.heartbeat.phiaccrual.failuredetector.threshold: 10
    hazelcast.heartbeat.phiaccrual.failuredetector.sample.size: 200
    hazelcast.heartbeat.phiaccrual.failuredetector.min.std.dev.millis: 100
