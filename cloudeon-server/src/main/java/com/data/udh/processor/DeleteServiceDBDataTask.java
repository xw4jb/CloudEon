package com.data.udh.processor;

import cn.hutool.extra.spring.SpringUtil;
import com.data.udh.service.DeleteClusterService;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class DeleteServiceDBDataTask extends BaseUdhTask {

    @Override
    public void internalExecute() {
        Integer serviceInstanceId = taskParam.getServiceInstanceId();
        DeleteClusterService deleteClusterService = SpringUtil.getBean(DeleteClusterService.class);
        log.info("开始删除 {} 服务相关的表数据....", taskParam.getServiceInstanceName());
        deleteClusterService.deleteOneService(serviceInstanceId);
    }
}