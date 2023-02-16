package cn.edu.guet.http;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 陶祎祎
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class HttpResult<T> {
    private int code;
    private String msg;
    private Object data;

    public static HttpResult success(String msg) {
        HttpResult r = new HttpResult();
        r.setCode(200);
        r.setMsg(msg);
        return r;
    }

    public static HttpResult success(Object data) {
        HttpResult r = new HttpResult();
        r.setCode(200);
        r.setData(data);
        return r;
    }

    public static HttpResult success(String msg,Object data) {
        HttpResult r = new HttpResult();
        r.setCode(200);
        r.setMsg(msg);
        r.setData(data);
        return r;
    }

    public static HttpResult error() {
        return error(500, "未知异常，请联系管理员");
    }

    public static HttpResult error(String msg) {
        return error(500, msg);
    }

    public static HttpResult error(int code, String msg) {
        HttpResult r = new HttpResult();
        r.setCode(code);
        r.setMsg(msg);
        return r;
    }

}
