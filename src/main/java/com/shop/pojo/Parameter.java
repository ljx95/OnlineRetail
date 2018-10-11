package com.shop.pojo;

public class Parameter {
    private Integer id;

    private String value_id;

    private Integer value;

    private String describe;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getValue_id() {
        return value_id;
    }

    public void setValue_id(String value_id) {
        this.value_id = value_id == null ? null : value_id.trim();
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe == null ? null : describe.trim();
    }

    @Override
    public String
    toString() {
        return "Parameter{" +
                "id=" + id +
                ", value_id='" + value_id + '\'' +
                ", value=" + value +
                ", describe='" + describe + '\'' +
                '}';
    }
}