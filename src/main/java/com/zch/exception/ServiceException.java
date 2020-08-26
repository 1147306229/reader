package com.zch.exception;

/**
 * java类简单作用描述:
 *
 * @ProjectName: SSM-ReadBook
 * @Package: com.zch.exception
 * @Description: java类作用描述
 * @Author: 钟创辉
 * @CreateDate: 2020/6/30 14:58
 * @UpdateDate: 2020/6/30 14:58
 * @UpdateRemark: The modified content
 * @Version: 1.0
 * <p>Copyright: Copyright (c) 2020</p>
 */
public class ServiceException extends RuntimeException {
    public ServiceException() {
        super();
    }

    public ServiceException(String message) {
        super(message);
    }
}
