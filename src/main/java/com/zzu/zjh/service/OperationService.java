package com.zzu.zjh.service;

import com.zzu.zjh.entity.Operation;
import com.zzu.zjh.entity.OperationDto;

import java.util.List;

public interface OperationService {
     OperationDto getInOperationsByPage(int page, int rows);
     OperationDto getOutOperationsByPage(int page, int rows);
     String increaseOperation(Operation operation);
}
