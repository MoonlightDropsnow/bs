package com.zzu.zjh.controller;

import com.zzu.zjh.entity.Operation;
import com.zzu.zjh.entity.OperationDto;
import com.zzu.zjh.service.OperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("operation")
public class OperationController {
    @Autowired
    private OperationService operationService;
    @RequestMapping("allInOperationsThisPage")
    public OperationDto allInOperationsThisPage(Integer page, Integer rows) {
        return operationService.getInOperationsByPage(page,rows);
    }
    @RequestMapping("allOutOperationsThisPage")
    public OperationDto allOutOperationsThisPage(Integer page, Integer rows) {
        return operationService.getOutOperationsByPage(page,rows);
    }
    @RequestMapping("addOperation")
    public String increaseOperation(Operation operation){
        return operationService.increaseOperation(operation);
    }

}
