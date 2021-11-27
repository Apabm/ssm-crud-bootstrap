package crud.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Zhy
 * @create 2021-11-22 18:48
 */
public class Msg {
    private Integer status;
    private String msg;
    private Map<String,Object> map = new HashMap<String, Object>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setStatus(100);
        msg.setMsg("处理成功！");
        return msg;
    }

    public static Msg fail(){
        Msg msg = new Msg();
        msg.setStatus(200);
        msg.setMsg("处理失败！");
        return msg;
    }

    public Msg add(String key,Object value){
        this.getMap().put(key, value);
        return this;
    }


    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
