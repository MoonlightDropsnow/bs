package com.zzu.zjh.service;

import com.zzu.zjh.entity.Operation;
import com.zzu.zjh.entity.OperationDto;

import java.util.List;

public interface OperationService {
    public List<Operation> getAllOperation();
    public OperationDto getInOperationsByPage(int page, int rows);
    public OperationDto getOutOperationsByPage(int page, int rows);
    public void increaseOperation(Operation operation);
}
