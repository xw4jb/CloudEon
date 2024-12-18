apiVersion: v1
kind: ConfigMap
metadata:
  name: "${serviceFullName}-grafana-dashboard"
  labels:
    grafana_dashboard: "1"
    serviceName: "${serviceFullName}"
  annotations:
    folder: "${serviceFullName}"
data:
  k8s-dashboard.json: |
    <#noparse >
    {
      "annotations": {
        "list": [
          {
            "builtIn": 1,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "enable": true,
            "hide": true,
            "iconColor": "rgba(0, 211, 255, 1)",
            "name": "Annotations & Alerts",
            "target": {
              "limit": 100,
              "matchAny": false,
              "tags": [],
              "type": "dashboard"
            },
            "type": "dashboard"
          }
        ]
      },
      "editable": true,
      "fiscalYearStartMonth": 0,
      "gnetId": 9734,
      "graphTooltip": 0,
      "id": null,
      "iteration": 1681188088101,
      "links": [],
      "liveNow": false,
      "panels": [
        {
          "collapsed": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "gridPos": {
            "h": 1,
            "w": 24,
            "x": 0,
            "y": 0
          },
          "id": 45,
          "panels": [],
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "refId": "A"
            }
          ],
          "title": "Overview",
          "type": "row"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "Num of  Doris Clusters",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 4,
            "x": 0,
            "y": 1
          },
          "id": 1,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "8.5.22",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "count(node_info{type=\"is_master\"})",
              "format": "time_series",
              "instant": true,
              "intervalFactor": 1,
              "refId": "A"
            }
          ],
          "title": "Cluster Number",
          "type": "stat"
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "decimals": 0,
          "description": "Dead Frontends will be shown as Colored points.\nIf all Frontends are alive, all points should be Green.",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 10,
            "x": 4,
            "y": 1
          },
          "hiddenSeries": false,
          "id": 70,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": false,
            "hideEmpty": false,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": false
          },
          "lines": false,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": true,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": true,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*DEAD/"
            },
            {
              "alias": "/.*ALIVE/",
              "color": "rgb(0, 255, 0)"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "(up{job=~\"metrics-doris-fe.*\"} == 0) +0",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{job}}-{{instance}}: DEAD",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "(up{job=~\"metrics-doris-fe.*\"} == 1) +0",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{job}}-{{instance}}: ALIVE",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Frontends Status",
          "tooltip": {
            "shared": true,
            "sort": 1,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "short",
              "logBase": 1,
              "max": "1",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "decimals": 0,
          "description": "Dead Backends will be shown as Colored points.\nIf all Backends are alive, all points should be Green.",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 10,
            "x": 14,
            "y": 1
          },
          "hiddenSeries": false,
          "id": 69,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "hideEmpty": false,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": false,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": true,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": true,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*ALIVE/",
              "color": "rgb(0, 255, 0)"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "(up{job=~\"metrics-doris-be.*\"} == 0) +0",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{job}}-{{instance}}: DEAD",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "(up{job=~\"metrics-doris-be.*\"} == 1) +0",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{job}}-{{instance}}: ALIVE",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Backends status",
          "tooltip": {
            "shared": true,
            "sort": 1,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "short",
              "logBase": 1,
              "max": "1",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The JVM heap usage percent of each Frontend of each Doris cluster.",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 0,
            "y": 8
          },
          "hiddenSeries": false,
          "id": 5,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 1,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "sum(jvm_heap_size_bytes{job=~\"metrics-doris-fe.*\", type=\"used\"} * 100) by (instance, job) / sum(jvm_heap_size_bytes{job=~\"metrics-doris-fe.*\", type=\"max\"}) by (instance, job)",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "{{job}}-{{instance}}",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Cluster FE JVM Heap Stat",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "percent",
              "logBase": 1,
              "max": "100",
              "min": "0",
              "show": true
            },
            {
              "format": "percent",
              "logBase": 1,
              "max": "100",
              "min": "0",
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The Backend CPU idle overview of each Doris cluster.\nThe detail Backend CPU idle info can be seen in 'BE' section.",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 8,
            "y": 8
          },
          "hiddenSeries": false,
          "id": 8,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "(sum(rate(doris_be_cpu{mode=\"idle\"}[$interval])) by (job)) / (sum(rate(doris_be_cpu[$interval])) by (job))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{job}}",
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Cluster BE CPU Idle",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "percentunit",
              "logBase": 1,
              "max": "1",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The Backend memory usage overview of each Doris cluster.\nThe detail backend memory usage can be seen in 'BE' section.",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 16,
            "y": 8
          },
          "hiddenSeries": false,
          "id": 9,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "avg(doris_be_memory_allocated_bytes) by (job)",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{job}}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Cluster BE Mem Stat",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "QPS statistic group by cluster.\nThe QPS of each cluster is the sum of all queries processed on all Frontends.",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 0,
            "y": 15
          },
          "hiddenSeries": false,
          "id": 31,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": false,
            "show": true,
            "sort": "max",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "sum by (job)(rate(doris_fe_query_total{job=~\"metrics-doris-fe.*\"}[$interval]))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{job}}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Cluster QPS Stat",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "decimals": 0,
          "description": "The Disk state. GREEN point means this disk is ONLINE. RED point means this disk is OFFLINE",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 8,
            "y": 15
          },
          "hiddenSeries": false,
          "id": 119,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": false,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": true,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*OFFLINE/",
              "color": "#bf1b00",
              "points": true
            },
            {
              "alias": "/.*ONLINE/",
              "color": "rgb(85, 255, 0)",
              "points": true
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "(doris_be_disks_state{namespace=~\"$namespace\"} == 0)+0",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}: {{path}} OFFLINE",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "(doris_be_disks_state{namespace=~\"$namespace\"} == 1)+0",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "{{instance}}: {{path}} ONLINE",
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] Disk State",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "short",
              "logBase": 1,
              "max": "1",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "collapsed": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "gridPos": {
            "h": 1,
            "w": 24,
            "x": 0,
            "y": 22
          },
          "id": 46,
          "panels": [],
          "repeat": "cluster_name",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "refId": "A"
            }
          ],
          "title": "Cluster Overview",
          "type": "row"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "Total Frontends node number",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 6,
            "w": 4,
            "x": 0,
            "y": 23
          },
          "id": 10,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "8.5.22",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "count(up{job=~\"metrics-doris-fe.*\", namespace=~\"$namespace\"})",
              "format": "time_series",
              "instant": true,
              "intervalFactor": 1,
              "refId": "A"
            }
          ],
          "title": "[$cluster_name] FE Node",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "Total alive number of Frontends. Normally, it should be equal to the Total number of Frontends",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 6,
            "w": 4,
            "x": 4,
            "y": 23
          },
          "id": 12,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "8.5.22",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "count(up{job=~\"metrics-doris-fe.*\", namespace=~\"$namespace\"}==1)",
              "format": "time_series",
              "instant": true,
              "intervalFactor": 2,
              "refId": "A"
            }
          ],
          "title": "[$cluster_name]  FE Alive",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "Total Backends node number",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 6,
            "w": 4,
            "x": 8,
            "y": 23
          },
          "id": 11,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "8.5.22",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "count(up{job=~\"metrics-doris-be.*\", namespace=~\"$namespace\"})",
              "format": "time_series",
              "instant": true,
              "intervalFactor": 1,
              "refId": "A"
            }
          ],
          "title": "[$cluster_name] BE Node",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "Total alive number of Backends. Normally, it should be equal to the Total number of Backends.",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 6,
            "w": 4,
            "x": 12,
            "y": 23
          },
          "id": 14,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "8.5.22",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "count(up{job=~\"metrics-doris-be.*\", namespace=~\"$namespace\"}==1)",
              "format": "time_series",
              "instant": true,
              "intervalFactor": 1,
              "refId": "A"
            }
          ],
          "title": "[$cluster_name] BE Alive",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "Total used disk capacity of all Backends.",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "decbytes"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 6,
            "w": 4,
            "x": 16,
            "y": 23
          },
          "id": 59,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "8.5.22",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "SUM(doris_be_disks_local_used_capacity{namespace=~\"$namespace\"})",
              "format": "time_series",
              "intervalFactor": 1,
              "range": true,
              "refId": "B"
            }
          ],
          "title": "[$cluster_name] Used Capacity",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "Total disk capacity of all Backends",
          "fieldConfig": {
            "defaults": {
              "color": {
                "fixedColor": "rgb(31, 120, 193)",
                "mode": "fixed"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "decbytes"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 6,
            "w": 4,
            "x": 20,
            "y": 23
          },
          "id": 58,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "8.5.22",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "SUM(doris_be_disks_total_capacity{namespace=~\"$namespace\"})",
              "format": "time_series",
              "instant": true,
              "intervalFactor": 1,
              "refId": "A"
            }
          ],
          "title": "[$cluster_name] Total Capacity",
          "type": "stat"
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The max replayed meta data journal id on Frontends.\nNormally, all Frontends should be same on this metrics, or just slightly different for a short period.",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 0,
            "y": 29
          },
          "hiddenSeries": false,
          "id": 63,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "doris_fe_max_journal_id{namespace=~\"$namespace\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] Max Replayed journal id",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:1483",
              "format": "none",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:1484",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The counter of meta data image generation on Master Frontend. And the counter of image successfully pushing to other Non-master Frontends.\nThese metrics is expected to increase at reasonable intervals. And normally, they should be equal.",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 6,
            "y": 29
          },
          "hiddenSeries": false,
          "id": 65,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_image_write{namespace=~\"$namespace\", instance=\"$fe_master\"}",
              "format": "time_series",
              "instant": false,
              "intervalFactor": 1,
              "legendFormat": "{{instance}}-write",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "doris_fe_image_push{namespace=~\"$namespace\", instance=\"$fe_master\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}-push",
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] Image counter",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:263",
              "decimals": 0,
              "format": "none",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:264",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The left Y axes shows write latency of 99th. The right Y axes shows the write per seconds of journal.",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 12,
            "y": 29
          },
          "hiddenSeries": false,
          "id": 112,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*-rate/",
              "points": true,
              "yaxis": 2
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "doris_fe_editlog_write_latency_ms{namespace=~\"$namespace\", instance=\"$fe_master\",quantile=\"0.99\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "{{instance}}-99th",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "rate(doris_fe_edit_log{namespace=~\"$namespace\", type=\"write\"}[$interval])",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "{{instance}}-write-rate",
              "range": true,
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] BDBJE Write",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:500",
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:501",
              "format": "wps",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The left Y axes shows the read per seconds of journal.",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 18,
            "y": 29
          },
          "hiddenSeries": false,
          "id": 152,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:457",
              "alias": "/.*-rate/",
              "points": true
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "exemplar": false,
              "expr": "rate(doris_fe_edit_log{namespace=~\"$namespace\", type=\"read\"}[$interval])",
              "format": "time_series",
              "hide": false,
              "instant": false,
              "intervalFactor": 1,
              "legendFormat": "{{instance}}-read-rate",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] BDBJE Read",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:500",
              "format": "rps",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:501",
              "format": "wps",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The edit log size for each FE",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 0,
            "y": 35
          },
          "hiddenSeries": false,
          "id": 150,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "avg",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_edit_log{namespace=~\"$namespace\", type=\"bytes\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] Edit Log Size",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "decimals": 0,
              "format": "decbytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "none",
              "label": "",
              "logBase": 1,
              "min": "0",
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The edit log clean of each FE",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 6,
            "y": 35
          },
          "hiddenSeries": false,
          "id": 144,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "avg",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_edit_log_clean{namespace=~\"$namespace\", type=\"success\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}_success",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_edit_log_clean{namespace=~\"$namespace\", type=\"failed\"}",
              "hide": false,
              "legendFormat": "{{instance}}_failed",
              "range": true,
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] Edit Log Clean",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "decimals": 0,
              "format": "none",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "none",
              "label": "",
              "logBase": 1,
              "min": "0",
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The FE collect compaction score of each BE",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 12,
            "y": 35
          },
          "hiddenSeries": false,
          "id": 158,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "avg",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_max_tablet_compaction_score{namespace=~\"$namespace\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] FE Collect Compaction Score",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:214",
              "decimals": 0,
              "format": "none",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:215",
              "format": "short",
              "logBase": 1,
              "min": "0",
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The compaction score of each BE",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 18,
            "y": 35
          },
          "hiddenSeries": false,
          "id": 142,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "avg",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_tablet_max_compaction_score{namespace=~\"$namespace\", instance=\"$fe_master\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{backend}}",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] BE Compaction Score",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:214",
              "decimals": 0,
              "format": "none",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:215",
              "format": "short",
              "logBase": 1,
              "min": "0",
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The image Write of each FE",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 0,
            "y": 41
          },
          "hiddenSeries": false,
          "id": 156,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "avg",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_image_write{namespace=~\"$namespace\", type=\"success\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}_success",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_image_write{namespace=~\"$namespace\", type=\"failed\"}",
              "hide": false,
              "legendFormat": "{{instance}}_failed",
              "range": true,
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] Image Write",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "decimals": 0,
              "format": "none",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "none",
              "label": "",
              "logBase": 1,
              "min": "0",
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The image push of each FE",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 6,
            "y": 41
          },
          "hiddenSeries": false,
          "id": 154,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "avg",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_image_push{namespace=~\"$namespace\", type=\"success\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}_success",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_image_push{namespace=~\"$namespace\", type=\"failed\"}",
              "hide": false,
              "legendFormat": "{{instance}}_failed",
              "range": true,
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] Image Push",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "decimals": 0,
              "format": "none",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "none",
              "label": "",
              "logBase": 1,
              "min": "0",
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The image clean of each FE",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 12,
            "y": 41
          },
          "hiddenSeries": false,
          "id": 146,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "avg",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_image_clean{namespace=~\"$namespace\", type=\"success\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}_success",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_fe_image_clean{namespace=~\"$namespace\", type=\"failed\"}",
              "hide": false,
              "legendFormat": "{{instance}}_failed",
              "range": true,
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] Image Clean",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "decimals": 0,
              "format": "none",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "none",
              "label": "",
              "logBase": 1,
              "min": "0",
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "Number of tablets begin scheduled. These tablet may be in recovery process or balance process",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 18,
            "y": 41
          },
          "hiddenSeries": false,
          "id": 117,
          "legend": {
            "avg": false,
            "current": true,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "expr": "doris_fe_scheduled_tablet_num{namespace=~\"$namespace\", instance=\"$fe_master\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Scheduling tablet number",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] Scheduling Tablets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:1383",
              "decimals": 0,
              "format": "short",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:1384",
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "description": "The max IO util of each Backend",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 6,
            "x": 0,
            "y": 47
          },
          "hiddenSeries": false,
          "id": 125,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "avg",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "8.5.22",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "editorMode": "code",
              "expr": "doris_be_max_disk_io_util_percent{namespace=~\"$namespace\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}",
              "range": true,
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "[$cluster_name] BE IO Util",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "percent",
              "logBase": 1,
              "max": "100",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "min": "0",
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "collapsed": true,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "gridPos": {
            "h": 1,
            "w": 24,
            "x": 0,
            "y": 53
          },
          "id": 47,
          "panels": [
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Requests per seconds on each Frontends.\nRequests include all requests sending to the Frontends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 9,
                "w": 8,
                "x": 0,
                "y": 3
              },
              "hiddenSeries": false,
              "id": 52,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "hideEmpty": false,
                "hideZero": false,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_fe_request_total{namespace=~\"$namespace\", job=~\"metrics-doris-fe.*\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] RPS",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "$$hashKey": "object:1329",
                  "format": "ops",
                  "logBase": 1,
                  "show": true
                },
                {
                  "$$hashKey": "object:1330",
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Queries per seconds on each Frontends.\nQueries only include Select requests.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 9,
                "w": 8,
                "x": 8,
                "y": 3
              },
              "hiddenSeries": false,
              "id": 53,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "hideEmpty": false,
                "hideZero": false,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_fe_query_total{namespace=~\"$namespace\", job=~\"metrics-doris-fe.*\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] QPS",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "$$hashKey": "object:1179",
                  "format": "ops",
                  "logBase": 1,
                  "show": true
                },
                {
                  "$$hashKey": "object:1180",
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "99 quantiles of query latency on each Frontends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 9,
                "w": 8,
                "x": 16,
                "y": 3
              },
              "hiddenSeries": false,
              "id": 54,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "hideEmpty": false,
                "hideZero": false,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(doris_fe_query_latency_ms{namespace=~\"$namespace\", quantile=\"0.99\"}) by (instance)",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] 99th Latency",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "$$hashKey": "object:1557",
                  "format": "ms",
                  "logBase": 1,
                  "show": true
                },
                {
                  "$$hashKey": "object:1558",
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates 95 to 99 quantiles of query latency on each Frontends.\nRight Y axes indicates the query rate per 1 min.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 0,
                "y": 12
              },
              "hiddenSeries": false,
              "id": 30,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": true,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "query rate",
                  "lines": false,
                  "points": true,
                  "yaxis": 2
                },
                {
                  "alias": "0.999",
                  "legend": false,
                  "lines": false
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_query_latency_ms{namespace=~\"$namespace\", instance=\"$fe_instance\"}",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "{{quantile}}",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_query_latency_ms_count{namespace=~\"$namespace\", instance=\"$fe_instance\"}",
                  "format": "time_series",
                  "hide": true,
                  "intervalFactor": 2,
                  "legendFormat": "count",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_fe_query_latency_ms_count{namespace=~\"$namespace\", instance=\"$fe_instance\"}[1m])",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "query rate",
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] [$fe_instance] Query Percentile",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "ms",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the accumulated  error queries number.\nRight Y axes indicates the error query rate per 1 min.\nNormally, the error query rate should be 0.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 8,
                "y": 12
              },
              "hiddenSeries": false,
              "id": 33,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": true,
                "min": true,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/Err Rate.*/",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_query_err{namespace=~\"$namespace\"}",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 2,
                  "legendFormat": "Err Counter-{{instance}}",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_fe_query_err{namespace=~\"$namespace\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Err Rate-{{instance}}",
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Query Error [1m]",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "decimals": 2,
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "The connections' number to each Frontends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 16,
                "y": 12
              },
              "hiddenSeries": false,
              "id": 34,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "max": true,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_connection_total{namespace=~\"$namespace\"}",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Connections",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            }
          ],
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "refId": "A"
            }
          ],
          "title": "Query Statistic",
          "type": "row"
        },
        {
          "collapsed": true,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "gridPos": {
            "h": 1,
            "w": 24,
            "x": 0,
            "y": 54
          },
          "id": 128,
          "panels": [
            {
              "columns": [],
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Statistic of Broker load jobs's num in each Load State.",
              "fontSize": "100%",
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 0,
                "y": 43
              },
              "id": 141,
              "links": [],
              "scroll": true,
              "showHeader": true,
              "sort": {
                "col": 0,
                "desc": true
              },
              "styles": [
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "pattern": "state",
                  "thresholds": [],
                  "type": "string",
                  "unit": "short"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 0,
                  "mappingType": 1,
                  "pattern": "Value",
                  "thresholds": [],
                  "type": "number",
                  "unit": "none"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "mappingType": 1,
                  "pattern": "/.*/",
                  "thresholds": [],
                  "type": "hidden",
                  "unit": "short"
                }
              ],
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"BROKER\", instance=\"$fe_master\"}",
                  "format": "table",
                  "hide": false,
                  "instant": true,
                  "intervalFactor": 2,
                  "refId": "A"
                }
              ],
              "title": "[$cluster_name] Broker Load Job",
              "transform": "table",
              "type": "table-old"
            },
            {
              "columns": [],
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Statistic of load jobs's num  in each Load State which is generated by Insert Stmt.",
              "fontSize": "100%",
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 6,
                "y": 43
              },
              "id": 140,
              "links": [],
              "scroll": true,
              "showHeader": true,
              "sort": {
                "col": 0,
                "desc": true
              },
              "styles": [
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "pattern": "state",
                  "thresholds": [],
                  "type": "string",
                  "unit": "short"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 0,
                  "mappingType": 1,
                  "pattern": "Value",
                  "thresholds": [],
                  "type": "number",
                  "unit": "none"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "mappingType": 1,
                  "pattern": "/.*/",
                  "thresholds": [],
                  "type": "hidden",
                  "unit": "short"
                }
              ],
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"INSERT\", instance=\"$fe_master\"}",
                  "format": "table",
                  "instant": true,
                  "intervalFactor": 2,
                  "refId": "A"
                }
              ],
              "title": "[$cluster_name] Insert Load Job",
              "transform": "table",
              "type": "table-old"
            },
            {
              "columns": [],
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Statistic of Routine load jobs's num in each Load State.",
              "fontSize": "100%",
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 12,
                "y": 43
              },
              "id": 164,
              "links": [],
              "scroll": true,
              "showHeader": true,
              "sort": {
                "col": 0,
                "desc": true
              },
              "styles": [
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "pattern": "state",
                  "thresholds": [],
                  "type": "string",
                  "unit": "short"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 0,
                  "mappingType": 1,
                  "pattern": "Value",
                  "thresholds": [],
                  "type": "number",
                  "unit": "none"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "mappingType": 1,
                  "pattern": "/.*/",
                  "thresholds": [],
                  "type": "hidden",
                  "unit": "short"
                }
              ],
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"ROUTINE_LOAD\", instance=\"$fe_master\"}",
                  "format": "table",
                  "instant": true,
                  "intervalFactor": 2,
                  "refId": "A"
                }
              ],
              "title": "[$cluster_name] Routine Load Job",
              "transform": "table",
              "type": "table-old"
            },
            {
              "columns": [],
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Statistic of Spark load jobs's num in each Load State.",
              "fontSize": "100%",
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 18,
                "y": 43
              },
              "id": 166,
              "links": [],
              "scroll": true,
              "showHeader": true,
              "sort": {
                "col": 0,
                "desc": true
              },
              "styles": [
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "pattern": "state",
                  "thresholds": [],
                  "type": "string",
                  "unit": "short"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 0,
                  "mappingType": 1,
                  "pattern": "Value",
                  "thresholds": [],
                  "type": "number",
                  "unit": "none"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "mappingType": 1,
                  "pattern": "/.*/",
                  "thresholds": [],
                  "type": "hidden",
                  "unit": "short"
                }
              ],
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"SPARK\", instance=\"$fe_master\"}",
                  "format": "table",
                  "instant": true,
                  "intervalFactor": 2,
                  "refId": "A"
                }
              ],
              "title": "[$cluster_name] Spark Load Job",
              "transform": "table",
              "type": "table-old"
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "The trend report of broker load job",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 0,
                "y": 49
              },
              "hiddenSeries": false,
              "id": 133,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "rightSide": true,
                "show": true,
                "sort": "current",
                "sortDesc": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"BROKER\", instance=\"$fe_master\", state=\"PENDING\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "PENDING",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"BROKER\", instance=\"$fe_master\", state=\"ETL\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "ETL",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"BROKER\", instance=\"$fe_master\", state=\"LOADING\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "LOADING",
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Broker load tendency",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "show": false
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "The trend report of insert load job",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 6,
                "y": 49
              },
              "hiddenSeries": false,
              "id": 134,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "rightSide": true,
                "show": true,
                "sort": "current",
                "sortDesc": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"INSERT\", instance=\"$fe_master\", state=\"PENDING\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "PENDING",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"INSERT\", instance=\"$fe_master\", state=\"ETL\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "ETL",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"INSERT\", instance=\"$fe_master\", state=\"LOADING\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "LOADING",
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Insert load tendency",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "show": false
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "The trend report of routine load job",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 12,
                "y": 49
              },
              "hiddenSeries": false,
              "id": 170,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "rightSide": true,
                "show": true,
                "sort": "current",
                "sortDesc": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"ROUTINE_LOAD\", instance=\"$fe_master\", state=\"NEED_SCHEDULE\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "NEED_SCHEDULE",
                  "range": true,
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"ROUTINE_LOAD\", instance=\"$fe_master\", state=\"RUNNING\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "RUNNING",
                  "range": true,
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"ROUTINE_LOAD\", instance=\"$fe_master\", state=\"PAUSED\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "PAUSED",
                  "range": true,
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Routine load tendency",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "$$hashKey": "object:2767",
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "$$hashKey": "object:2768",
                  "format": "short",
                  "logBase": 1,
                  "show": false
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "The trend report of spark load job",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 18,
                "y": 49
              },
              "hiddenSeries": false,
              "id": 168,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "rightSide": true,
                "show": true,
                "sort": "current",
                "sortDesc": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"SPARK\", instance=\"$fe_master\", state=\"PENDING\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "PENDING",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"SPARK\", instance=\"$fe_master\", state=\"ETL\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "ETL",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", exported_job=\"load\", type=\"SPARK\", instance=\"$fe_master\", state=\"LOADING\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "LOADING",
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Spark load tendency",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "$$hashKey": "object:2985",
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "$$hashKey": "object:2986",
                  "format": "short",
                  "logBase": 1,
                  "show": false
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "columns": [],
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Number of running schema change jobs.",
              "fontSize": "100%",
              "gridPos": {
                "h": 3,
                "w": 6,
                "x": 0,
                "y": 55
              },
              "id": 135,
              "links": [],
              "scroll": true,
              "showHeader": true,
              "sort": {
                "col": 0,
                "desc": true
              },
              "styles": [
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "pattern": "state",
                  "thresholds": [],
                  "type": "string",
                  "unit": "short"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "mappingType": 1,
                  "pattern": "Value",
                  "thresholds": [],
                  "type": "number",
                  "unit": "short"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "link": false,
                  "mappingType": 1,
                  "pattern": "/.*/",
                  "thresholds": [],
                  "type": "hidden",
                  "unit": "short"
                }
              ],
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", instance=\"$fe_master\", type=\"SCHEMA_CHANGE\"}",
                  "format": "table",
                  "hide": false,
                  "instant": true,
                  "intervalFactor": 2,
                  "legendFormat": "asds",
                  "refId": "A"
                }
              ],
              "title": "[$cluster_name] SC Job",
              "transform": "table",
              "type": "table-old"
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Queue size of report in Master FE.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 6,
                "y": 55
              },
              "hiddenSeries": false,
              "id": 137,
              "legend": {
                "avg": true,
                "current": false,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_report_queue_size{namespace=~\"$namespace\", instance=\"$fe_master\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Report queue size",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Report queue size",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "$$hashKey": "object:2027",
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "$$hashKey": "object:2028",
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "columns": [],
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Number of running rollup jobs.",
              "fontSize": "100%",
              "gridPos": {
                "h": 3,
                "w": 6,
                "x": 0,
                "y": 58
              },
              "id": 136,
              "links": [],
              "scroll": true,
              "showHeader": true,
              "sort": {
                "col": 0,
                "desc": true
              },
              "styles": [
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "pattern": "state",
                  "thresholds": [],
                  "type": "string",
                  "unit": "short"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "mappingType": 1,
                  "pattern": "Value",
                  "thresholds": [],
                  "type": "number",
                  "unit": "short"
                },
                {
                  "alias": "",
                  "align": "auto",
                  "colors": [
                    "rgba(245, 54, 54, 0.9)",
                    "rgba(237, 129, 40, 0.89)",
                    "rgba(50, 172, 45, 0.97)"
                  ],
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "decimals": 2,
                  "mappingType": 1,
                  "pattern": "/.*/",
                  "thresholds": [],
                  "type": "hidden",
                  "unit": "short"
                }
              ],
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_job{namespace=~\"$namespace\", instance=\"$fe_master\", type=\"ROLLUP\"}",
                  "format": "table",
                  "instant": true,
                  "intervalFactor": 2,
                  "refId": "A"
                }
              ],
              "title": "[$cluster_name] Rollup Job",
              "transform": "table",
              "type": "table-old"
            }
          ],
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "refId": "A"
            }
          ],
          "title": "Jobs",
          "type": "row"
        },
        {
          "collapsed": true,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "gridPos": {
            "h": 1,
            "w": 24,
            "x": 0,
            "y": 55
          },
          "id": 107,
          "panels": [
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Show the number and rate of txn begin and success",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 0,
                "y": 5
              },
              "hiddenSeries": false,
              "id": 124,
              "legend": {
                "alignAsTable": false,
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "txn failed",
                  "yaxis": 1
                },
                {
                  "alias": "rate",
                  "yaxis": 2
                },
                {
                  "alias": "txn begin rate",
                  "lines": false,
                  "points": true,
                  "yaxis": 2
                },
                {
                  "alias": "txn success rate",
                  "lines": false,
                  "points": true,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_txn_counter{type=\"begin\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "txn begin",
                  "range": true,
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_txn_counter{type=\"begin\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "txn success",
                  "range": true,
                  "refId": "D"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "irate(doris_fe_txn_counter{type=\"begin\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "txn begin rate",
                  "range": true,
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "irate(doris_fe_txn_counter{type=\"begin\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "txn success rate",
                  "range": true,
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Txn Begin/Success on FE",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "none",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "ops",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Show the failed txn request. Including rejected request and failed txn",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 6,
                "y": 5
              },
              "hiddenSeries": false,
              "id": 123,
              "legend": {
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "txn failed rate",
                  "lines": false,
                  "points": true
                },
                {
                  "alias": "txn reject rate",
                  "lines": false,
                  "points": true
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "rate(doris_fe_txn_counter{type=\"reject\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "txn reject rate",
                  "range": true,
                  "refId": "C"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "rate(doris_fe_txn_counter{type=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "txn failed rate",
                  "range": true,
                  "refId": "D"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Txn Failed/Reject on FE",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "ops",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "ops",
                  "logBase": 1,
                  "min": "0",
                  "show": false
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "The number of total publish task request and error rate.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 12,
                "y": 5
              },
              "hiddenSeries": false,
              "id": 126,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"publish\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"publish\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Publish Task on BE",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Show the txn rstatus on FE",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 8,
                "w": 6,
                "x": 0,
                "y": 11
              },
              "hiddenSeries": false,
              "id": 102,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/rollback/",
                  "color": "#bf1b00",
                  "points": true
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_txn_status{job=~\"metrics-doris-fe.*\", namespace=~\"$namespace\", type=\"prepare\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "prepare",
                  "range": true,
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_txn_status{job=~\"metrics-doris-fe.*\", namespace=~\"$namespace\", type=\"precommitted\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "precommitted",
                  "range": true,
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_txn_status{job=~\"metrics-doris-fe.*\", namespace=~\"$namespace\", type=\"committed\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "committed",
                  "range": true,
                  "refId": "C"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_fe_txn_status{job=~\"metrics-doris-fe.*\", namespace=~\"$namespace\", type=\"aborted\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "aborted",
                  "range": true,
                  "refId": "D"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "exemplar": false,
                  "expr": "doris_fe_txn_status{job=~\"metrics-doris-fe.*\", namespace=~\"$namespace\", type=\"visible\"}",
                  "hide": false,
                  "legendFormat": "visible",
                  "range": true,
                  "refId": "E"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "exemplar": false,
                  "expr": "doris_fe_txn_status{job=~\"metrics-doris-fe.*\", namespace=~\"$namespace\", type=\"unknown\"}",
                  "hide": false,
                  "legendFormat": "unknown",
                  "range": true,
                  "refId": "F"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] fe_txn_status",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "none",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "ops",
                  "logBase": 1,
                  "min": "0",
                  "show": false
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the total received bytes rate of txn. Right Y axes indicates the loaded rows rate of txn.",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 8,
                "w": 6,
                "x": 6,
                "y": 11
              },
              "hiddenSeries": false,
              "id": 103,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": true,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "rows",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(rate(doris_be_stream_load{job=~\"metrics-doris-be.*\", namespace=~\"$namespace\", type=\"receive_bytes\"}[$interval]))",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "bytes",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(rate(doris_be_stream_load{job=~\"metrics-doris-be.*\", namespace=~\"$namespace\", type=\"load_rows\"}[$interval]))",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "rows",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Txn Load Bytes/Rows rate",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "$$hashKey": "object:3114",
                  "format": "Bps",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "$$hashKey": "object:3115",
                  "format": "ops",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            }
          ],
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "refId": "A"
            }
          ],
          "title": "Transaction",
          "type": "row"
        },
        {
          "collapsed": true,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "gridPos": {
            "h": 1,
            "w": 24,
            "x": 0,
            "y": 56
          },
          "id": 49,
          "panels": [
            {
              "aliasColors": {
                "percentage": "#890f02"
              },
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "JVM Heap usage of specified Frontend.\nLeft Y Axes shows the used/max heap size.\nRight Y Axes shows the used percentage.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 0,
                "y": 6
              },
              "hiddenSeries": false,
              "id": 13,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "percentage",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_heap_size_bytes{instance=\"$fe_instance\", namespace=~\"$namespace\", type=\"used\"}",
                  "format": "time_series",
                  "hide": false,
                  "instant": false,
                  "intervalFactor": 2,
                  "legendFormat": "used",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_heap_size_bytes{instance=\"$fe_instance\", namespace=~\"$namespace\", type=\"max\"}",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 2,
                  "legendFormat": "max",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(jvm_heap_size_bytes{instance=\"$fe_instance\", namespace=~\"$namespace\", type=\"used\"}) * 100 / sum(jvm_heap_size_bytes{instance=\"$fe_instance\", namespace=~\"$namespace\", type=\"max\"})",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 2,
                  "legendFormat": "percentage",
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] [$fe_instance] JVM Heap",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "bytes",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "percent",
                  "logBase": 1,
                  "max": "100",
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {
                "percentage": "#890f02"
              },
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "JVM Non Heap usage of specified Frontend.\nLeft Y Axes shows the used/committed non heap size.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 6,
                "y": 6
              },
              "hiddenSeries": false,
              "id": 24,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "percentage",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_non_heap_size_bytes{instance=\"$fe_instance\", namespace=~\"$namespace\", type=\"used\"}",
                  "format": "time_series",
                  "hide": false,
                  "instant": false,
                  "intervalFactor": 2,
                  "legendFormat": "used",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_non_heap_size_bytes{instance=\"$fe_instance\", namespace=~\"$namespace\", type=\"committed\"}",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 2,
                  "legendFormat": "committed",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] [$fe_instance] JVM Non Heap",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "bytes",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "percent",
                  "logBase": 1,
                  "max": "100",
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {
                "percentage": "#890f02"
              },
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "JVM old generation usage of specified Frontend. Left Y Axes shows the used/max old generation size. Right Y Axes shows the used percentage.\nNormally, the usage percentage should be less than 80%.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 12,
                "y": 6
              },
              "hiddenSeries": false,
              "id": 27,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "percentage",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_old_size_bytes{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"used\"}",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "used",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_old_size_bytes{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"max\"}",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "max",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(jvm_old_size_bytes{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"used\"}) * 100 / sum(jvm_old_size_bytes{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"max\"})",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "percentage",
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] [$fe_instance] JVM Old",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "bytes",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "percent",
                  "logBase": 1,
                  "max": "100",
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {
                "percentage": "#890f02"
              },
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "JVM full gc stat of specified Frontend. \nLeft Y Axes shows times of full gc.\nRight Y Axes shows the time cost of each full gc.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 18,
                "y": 6
              },
              "hiddenSeries": false,
              "id": 29,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "percentage",
                  "yaxis": 2
                },
                {
                  "alias": "avg time",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_old_gc{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"count\"}",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "count",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(jvm_old_gc{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"time\"}) / sum(jvm_old_gc{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"count\"})",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 2,
                  "legendFormat": "avg time",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] [$fe_instance] JVM Old GC",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "ms",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {
                "percentage": "#890f02"
              },
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "JVM young generation usage of specified Frontend.\nLeft Y Axes shows the used/max young generation size.\nRight Y Axes shows the used percentage.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 0,
                "y": 12
              },
              "hiddenSeries": false,
              "id": 26,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "percentage",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_young_size_bytes{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"used\"}",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "used",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_young_size_bytes{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"max\"}",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "max",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(jvm_young_size_bytes{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"used\"}) * 100 / sum(jvm_young_size_bytes{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"max\"})",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "percentage",
                  "refId": "C"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] [$fe_instance] JVM Young",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "bytes",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "percent",
                  "logBase": 1,
                  "max": "100",
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {
                "percentage": "#890f02"
              },
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "JVM young gc stat of specified Frontend. \nLeft Y Axes shows times of young gc.\nRight Y Axes shows the time cost of each young gc.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 6,
                "y": 12
              },
              "hiddenSeries": false,
              "id": 28,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "percentage",
                  "yaxis": 2
                },
                {
                  "alias": "avg time",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_young_gc{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"count\"}",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "count",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(jvm_young_gc{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"time\"}) / sum(jvm_young_gc{namespace=~\"$namespace\", instance=\"$fe_instance\", type=\"count\"})",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 2,
                  "legendFormat": "avg time",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] [$fe_instance] JVM Young GC",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "ms",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Num of threads of FE JVM",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 6,
                "x": 12,
                "y": 12
              },
              "hiddenSeries": false,
              "id": 88,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": true,
                "min": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "jvm_thread{namespace=~\"$namespace\", job=~\"metrics-doris-fe.*\", type=\"count\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] JVM Threads",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            }
          ],
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "refId": "A"
            }
          ],
          "title": "FE JVM",
          "type": "row"
        },
        {
          "collapsed": true,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "gridPos": {
            "h": 1,
            "w": 24,
            "x": 0,
            "y": 57
          },
          "id": 50,
          "panels": [
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "CPU idle stat of Backends.\nLow means CPU is busy.",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 9,
                "w": 12,
                "x": 0,
                "y": 7
              },
              "hiddenSeries": false,
              "id": 32,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "(sum(rate(doris_be_cpu{mode=\"idle\", namespace=~\"$namespace\"}[$interval])) by (job, instance)) / (sum(rate(doris_be_cpu{namespace=~\"$namespace\"}[$interval])) by (job, instance)) * 100",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE CPU Idle",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "percent",
                  "logBase": 1,
                  "max": "100",
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Memory usage of Backends.",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 9,
                "w": 12,
                "x": 12,
                "y": 7
              },
              "hiddenSeries": false,
              "id": 38,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "hideEmpty": false,
                "hideZero": false,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "sort": "current",
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_be_memory_allocated_bytes{namespace=~\"$namespace\"}",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE Mem",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "bytes",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Network send(Left Y)/receive(Right Y) bytes rate of all device except 'lo'",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 7,
                "w": 8,
                "x": 0,
                "y": 16
              },
              "hiddenSeries": false,
              "id": 86,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/.*-receive/",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_network_send_bytes{namespace=~\"$namespace\", job=~\"metrics-doris-be.*\", device!=\"lo\"}[$interval])",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-{{device}}-send",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_network_receive_bytes{namespace=~\"$namespace\", job=~\"metrics-doris-be.*\", device!=\"lo\"}[$interval])",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-{{device}}-receive",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Net send/receive bytes",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "Bps",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "Bps",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Disk capacity usage of Backends",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 7,
                "w": 8,
                "x": 8,
                "y": 16
              },
              "hiddenSeries": false,
              "id": 56,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "sort": "current",
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "(SUM(doris_be_disks_total_capacity{namespace=~\"$namespace\"}) by (instance, path) - SUM(doris_be_disks_avail_capacity{namespace=~\"$namespace\"}) by (instance, path)) / SUM(doris_be_disks_total_capacity{namespace=~\"$namespace\"}) by (instance, path)",
                  "format": "time_series",
                  "hide": false,
                  "instant": false,
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}:{{path}}",
                  "refId": "C"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "(SUM(doris_be_disks_local_used_capacity{namespace=~\"$namespace\"}) by (instance, path)) / SUM(doris_be_disks_total_capacity{namespace=~\"$namespace\"}) by (instance, path)",
                  "format": "time_series",
                  "hide": true,
                  "intervalFactor": 1,
                  "range": true,
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Disk Usage",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "percentunit",
                  "logBase": 1,
                  "max": "1",
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "show": false
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Number of tablets of each Backends",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 7,
                "w": 8,
                "x": 16,
                "y": 16
              },
              "hiddenSeries": false,
              "id": 115,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": true,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_fe_tablet_num{namespace=~\"$namespace\", instance=\"$fe_master\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{backend}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Tablet Distribution",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "none",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "show": false
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "The file descriptor usage of Backends. Left Y axes shows the used fd num. Right Y axes shows the soft limit open file number.",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 7,
                "w": 8,
                "x": 0,
                "y": 23
              },
              "hiddenSeries": false,
              "id": 94,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/.*limit/",
                  "points": true,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_be_process_fd_num_used{namespace=~\"$namespace\", job=~\"metrics-doris-be.*\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-used",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_be_process_fd_num_limit_soft{namespace=~\"$namespace\", job=~\"metrics-doris-be.*\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-soft limit",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE FD count",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "The thread number of Backends",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 7,
                "w": 8,
                "x": 8,
                "y": 23
              },
              "hiddenSeries": false,
              "id": 95,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_be_process_thread_num{namespace=~\"$namespace\", job=~\"metrics-doris-be.*\"}",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE thread num",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "IO util of Backends.\nHigh means I/O is busy.",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 7,
                "w": 8,
                "x": 16,
                "y": 23
              },
              "hiddenSeries": false,
              "id": 61,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": true,
                "max": true,
                "min": false,
                "show": true,
                "sort": "current",
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "rate(doris_be_disk_io_time_ms{namespace=~\"$namespace\"}[$interval]) / 10",
                  "format": "time_series",
                  "hide": true,
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-{{device}}",
                  "range": true,
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "editorMode": "code",
                  "expr": "doris_be_max_disk_io_util_percent",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "range": true,
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Disk IO util",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "percent",
                  "logBase": 1,
                  "max": "100",
                  "min": "0",
                  "show": true
                },
                {
                  "format": "short",
                  "logBase": 1,
                  "show": false
                }
              ],
              "yaxis": {
                "align": false,
                "alignLevel": 2
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Base compaction rate of Backends.\nNormally, base compaction only runs between 20:00 to 4:00 and it is configurable.\nRight Y axes indicates the total base compaction bytes.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 5,
                "w": 12,
                "x": 0,
                "y": 30
              },
              "hiddenSeries": false,
              "id": 39,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": false,
                "max": true,
                "min": false,
                "rightSide": true,
                "show": true,
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 0,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/Counter/",
                  "stack": true,
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "color": "rgb(27, 255, 0)",
                  "fill": 0,
                  "points": true,
                  "steppedLine": false,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": true,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_be_compaction_bytes_total{type=\"base\", namespace=~\"$namespace\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(doris_be_compaction_bytes_total{type=\"base\", namespace=~\"$namespace\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE Compaction Base",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "Bps",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "bytes",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Cumulative compaction rate of Backends.\nRight Y axes indicates the total cumulative compaction bytes.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 5,
                "w": 12,
                "x": 12,
                "y": 30
              },
              "hiddenSeries": false,
              "id": 40,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": false,
                "max": true,
                "min": false,
                "rightSide": true,
                "show": true,
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 0,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/Counter/",
                  "stack": true,
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "color": "rgb(15, 255, 0)",
                  "fill": 0,
                  "points": true,
                  "steppedLine": false,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": true,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_be_compaction_bytes_total{type=\"cumulative\", namespace=~\"$namespace\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_compaction_bytes_total{type=\"cumulative\", namespace=~\"$namespace\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE Compaction Cumulate",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "Bps",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "bytes",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Loading rate of Backends.\nThis indicates the rate of file downloading in LOADING state of load job(MINI and BROKER load).\nRight Y axes indicates the total rate of file downloading.",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 5,
                "w": 12,
                "x": 0,
                "y": 35
              },
              "hiddenSeries": false,
              "id": 41,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "max": false,
                "min": false,
                "rightSide": true,
                "show": true,
                "sort": "avg",
                "sortDesc": false,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/Counter/",
                  "stack": true,
                  "yaxis": 2
                },
                {
                  "alias": "Total rate",
                  "bars": false,
                  "color": "rgb(56, 255, 0)",
                  "lines": true,
                  "points": true,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_be_push_request_write_bytes{namespace=~\"$namespace\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(rate(doris_be_push_request_write_bytes{namespace=~\"$namespace\"}[$interval]))",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total rate",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE Push Bytes",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "Bps",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "Bps",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Loading rows rate of Backends.\nThis indicates the rate of rows loaded in LOADING state of load job. Right Y axes shows the total push rate of cluster.",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 5,
                "w": 12,
                "x": 12,
                "y": 35
              },
              "hiddenSeries": false,
              "id": 42,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "max": false,
                "min": false,
                "rightSide": true,
                "show": true,
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/Total/",
                  "color": "rgb(0, 255, 26)",
                  "points": true,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_be_push_request_write_rows{namespace=~\"$namespace\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(rate(doris_be_push_request_write_rows{namespace=~\"$namespace\"}[$interval]))",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "legendFormat": "Total",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE Push Rows",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "ops",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "ops",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Scan rate of Backends.\nThis indicates the read rate when processing queries.",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 5,
                "w": 12,
                "x": 0,
                "y": 40
              },
              "hiddenSeries": false,
              "id": 43,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "max": false,
                "min": false,
                "rightSide": true,
                "show": true,
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/Counter/",
                  "stack": true,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_be_query_scan_bytes{namespace=~\"$namespace\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "",
                  "format": "time_series",
                  "intervalFactor": 2,
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE Scan Bytes",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "Bps",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "ops",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Scan rows rate of Backends.\nThis indicates the read rows rate when processing queries.",
              "fill": 0,
              "fillGradient": 0,
              "gridPos": {
                "h": 5,
                "w": 12,
                "x": 12,
                "y": 40
              },
              "hiddenSeries": false,
              "id": 44,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "max": false,
                "min": false,
                "rightSide": true,
                "show": true,
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/Counter/",
                  "stack": true,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "rate(doris_be_query_scan_rows{namespace=~\"$namespace\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] BE Scan Rows",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "ops",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "ops",
                  "logBase": 1,
                  "show": false
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes shows the write rate of tablet header saved in rocksdb. Right Y axes shows the duration of each write operation.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 9,
                "w": 12,
                "x": 0,
                "y": 45
              },
              "hiddenSeries": false,
              "id": 109,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 0,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 1,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/.*-latency/",
                  "dashes": true,
                  "fill": 0,
                  "linewidth": 1,
                  "steppedLine": false,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": true,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_meta_request_total{namespace=~\"$namespace\", type=\"write\"}[$interval])",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-rate",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_be_meta_request_duration{namespace=~\"$namespace\", type=\"write\"} / doris_be_meta_request_total{namespace=~\"$namespace\", type=\"write\"}",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-latency",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Tablet Meta Write",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "wps",
                  "logBase": 1,
                  "show": true
                },
                {
                  "format": "µs",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes shows the read rate of tablet header saved in rocksdb. Right Y axes shows the duration of each read operation.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 9,
                "w": 12,
                "x": 12,
                "y": 45
              },
              "hiddenSeries": false,
              "id": 110,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": false,
                "max": true,
                "min": false,
                "rightSide": false,
                "show": true,
                "sortDesc": true,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 0,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 1,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/.*-latency/",
                  "dashes": true,
                  "fill": 0,
                  "linewidth": 1,
                  "steppedLine": false,
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": true,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_meta_request_total{namespace=~\"$namespace\", type=\"read\"}[$interval])",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-rate",
                  "refId": "B"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "doris_be_meta_request_duration{namespace=~\"$namespace\", type=\"read\"} / doris_be_meta_request_total{namespace=~\"$namespace\", type=\"read\"}",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-latency",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Tablet Meta Read",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "wps",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "format": "µs",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            }
          ],
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "refId": "A"
            }
          ],
          "title": "BE",
          "type": "row"
        },
        {
          "collapsed": true,
          "datasource": {
            "type": "prometheus",
            "uid": "prometheus"
          },
          "gridPos": {
            "h": 1,
            "w": 24,
            "x": 0,
            "y": 58
          },
          "id": 75,
          "panels": [
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 0,
                "y": 8
              },
              "hiddenSeries": false,
              "id": 78,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"report_all_tablets\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"report_all_tablets\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Tablets Report",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 8,
                "y": 8
              },
              "hiddenSeries": false,
              "id": 79,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"report_tablet\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"report_tablet\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Single Tablet Report",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 16,
                "y": 8
              },
              "hiddenSeries": false,
              "id": 82,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"finish_task\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"finish_task\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Finish task report",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 0,
                "y": 14
              },
              "hiddenSeries": false,
              "id": 91,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "sortDesc": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "sum(doris_be_push_requests_total{namespace=~\"$namespace\", status=\"SUCCESS\"})",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_push_requests_total{namespace=~\"$namespace\", status=\"FAIL\"}[$interval])",
                  "format": "time_series",
                  "hide": false,
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}-failed",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Push Task",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "The average cost time of push tasks on each Backend.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 8,
                "y": 14
              },
              "hiddenSeries": false,
              "id": 92,
              "legend": {
                "alignAsTable": true,
                "avg": true,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "sort": "avg",
                "sortDesc": false,
                "total": false,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_push_request_duration_us{namespace=~\"$namespace\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Push Task Cost Time",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "µs",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 16,
                "y": 14
              },
              "hiddenSeries": false,
              "id": 80,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"delete\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"delete\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Delete",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 0,
                "y": 20
              },
              "hiddenSeries": false,
              "id": 84,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"base_compaction\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"base_compaction\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Base Compaction",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 8,
                "y": 20
              },
              "hiddenSeries": false,
              "id": 83,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "sort": "total",
                "sortDesc": false,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"cumulative_compaction\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"cumulative_compaction\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Cumulative Compaction",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 16,
                "y": 20
              },
              "hiddenSeries": false,
              "id": 81,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "8.5.22",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"clone\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"clone\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Clone",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 0,
                "y": 26
              },
              "hiddenSeries": false,
              "id": 76,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"create_rollup\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"create_rollup\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Create rollup",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 8,
                "y": 26
              },
              "hiddenSeries": false,
              "id": 77,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"schema_change\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"schema_change\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Schema change",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "description": "Left Y axes indicates the failure rate of specified tasks. Normally, it should be 0.\nRight Y axes indicates the total number of specified tasks in all Backends.",
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": 6,
                "w": 8,
                "x": 16,
                "y": 26
              },
              "hiddenSeries": false,
              "id": 73,
              "legend": {
                "alignAsTable": true,
                "avg": false,
                "current": true,
                "max": false,
                "min": false,
                "rightSide": false,
                "show": true,
                "total": true,
                "values": true
              },
              "lines": true,
              "linewidth": 1,
              "links": [],
              "nullPointMode": "null",
              "options": {
                "alertThreshold": true
              },
              "percentage": false,
              "pluginVersion": "9.4.3",
              "pointradius": 5,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "Failed",
                  "yaxis": 2
                },
                {
                  "alias": "Total",
                  "yaxis": 2
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "SUM(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"create_tablet\", status=\"total\"})",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "Total",
                  "refId": "A"
                },
                {
                  "datasource": {
                    "type": "prometheus",
                    "uid": "prometheus"
                  },
                  "expr": "irate(doris_be_engine_requests_total{namespace=~\"$namespace\", type=\"create_tablet\", status=\"failed\"}[$interval])",
                  "format": "time_series",
                  "intervalFactor": 1,
                  "legendFormat": "{{instance}}",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeRegions": [],
              "title": "[$cluster_name] Create tablet",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "mode": "time",
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "short",
                  "logBase": 1,
                  "min": "0",
                  "show": true
                },
                {
                  "decimals": 0,
                  "format": "short",
                  "logBase": 1,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false
              }
            }
          ],
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "prometheus"
              },
              "refId": "A"
            }
          ],
          "title": "BE tasks",
          "type": "row"
        }
      ],
      "refresh": "",
      "revision": 1,
      "schemaVersion": 36,
      "style": "dark",
      "tags": [],
      "templating": {
        "list": [
          {
            "current": {},
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "definition": "",
            "hide": 0,
            "includeAll": false,
            "multi": false,
            "name": "namespace",
            "options": [],
            "query": "label_values({pod=~\".*doris.*\",job!=\"kubelet\",job!=\"kube-state-metrics\"},namespace)",
            "refresh": 2,
            "regex": "",
            "skipUrlSync": false,
            "sort": 0,
            "tagValuesQuery": "",
            "tagsQuery": "",
            "type": "query",
            "useTags": false
          },
          {
            "current": {},
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "definition": "",
            "hide": 0,
            "includeAll": false,
            "multi": false,
            "name": "fe_master",
            "options": [],
            "query": {
              "query": "query_result(node_info{job=~\"metrics-doris-fe.*\", type=\"is_master\"})",
              "refId": "Prometheus-fe_master-Variable-Query"
            },
            "refresh": 1,
            "regex": "/instance=\"(.+:\\d+)\"/",
            "skipUrlSync": false,
            "sort": 0,
            "tagValuesQuery": "",
            "tagsQuery": "",
            "type": "query",
            "useTags": false
          },
          {
            "current": {},
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "definition": "",
            "hide": 0,
            "includeAll": false,
            "multi": false,
            "name": "fe_instance",
            "options": [],
            "query": {
              "query": "up{job=~\"metrics-doris-fe.*\"}",
              "refId": "Prometheus-fe_instance-Variable-Query"
            },
            "refresh": 1,
            "regex": "/instance=\"(.+:\\d+)/",
            "skipUrlSync": false,
            "sort": 1,
            "tagValuesQuery": "",
            "tagsQuery": "",
            "type": "query",
            "useTags": false
          },
          {
            "current": {},
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "definition": "",
            "hide": 0,
            "includeAll": false,
            "multi": false,
            "name": "be_instance",
            "options": [],
            "query": {
              "query": "up{job=~\"metrics-doris-be.*\"}",
              "refId": "Prometheus-be_instance-Variable-Query"
            },
            "refresh": 1,
            "regex": "/instance=\"(.+:\\d+)/",
            "skipUrlSync": false,
            "sort": 0,
            "tagValuesQuery": "",
            "tagsQuery": "",
            "type": "query",
            "useTags": false
          },
          {
            "auto": false,
            "auto_count": 30,
            "auto_min": "10s",
            "current": {
              "selected": false,
              "text": "1m",
              "value": "1m"
            },
            "hide": 0,
            "name": "interval",
            "options": [
              {
                "selected": true,
                "text": "1m",
                "value": "1m"
              },
              {
                "selected": false,
                "text": "2m",
                "value": "2m"
              },
              {
                "selected": false,
                "text": "5m",
                "value": "5m"
              },
              {
                "selected": false,
                "text": "10m",
                "value": "10m"
              }
            ],
            "query": "1m,2m,5m,10m",
            "refresh": 2,
            "skipUrlSync": false,
            "type": "interval"
          }
        ]
      },
      "time": {
        "from": "now-1h",
        "to": "now"
      },
      "timepicker": {
        "refresh_intervals": [
          "5s",
          "10s",
          "30s",
          "1m",
          "5m",
          "15m",
          "30m",
          "1h",
          "2h",
          "1d"
        ],
        "time_options": [
          "5m",
          "15m",
          "1h",
          "6h",
          "12h",
          "24h",
          "2d",
          "7d",
          "30d"
        ]
      },
      "timezone": "browser",
      "title": "Doris Overview",
      "uid": "doris001",
      "version": 5,
      "weekStart": "",
      "description": "Dashboard for Apache Doris"
    }
    </#noparse>