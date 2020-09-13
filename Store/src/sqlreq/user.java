package sqlreq;

/**
 * 用户类父类
 */
public class user {
    private String _id;//用户id
    private String _name;//用户名称
    private String _phone;//手机号
    private String _email;//邮箱
    private int _type;//用户类型id
    private String _time;//注册时间
    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String get_name() {
        return _name;
    }

    public void set_name(String _name) {
        this._name = _name;
    }

    public String get_phone() {
        return _phone;
    }

    public void set_phone(String _phone) {
        this._phone = _phone;
    }

    public String get_email() {
        return _email;
    }

    public void set_email(String _email) {
        this._email = _email;
    }

    public int get_type() {
        return _type;
    }

    public void set_type(int _type) {
        this._type = _type;
    }

    public String get_time() {
        return _time;
    }

    public void set_time(String _time) {
        this._time = _time;
    }

    public user(String id,String name,String phone,String Email,int type,String time){
        this._id=id;
        this._name=name;
        this._phone=phone;
        this._email=Email;
        this._type=type;
        this._time=time;

    }
}
