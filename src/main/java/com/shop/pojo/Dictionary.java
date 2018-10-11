package com.shop.pojo;

public class Dictionary {
    private Integer id;

    private String type;

    private String describe;

    private Integer number;

    private String value;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe == null ? null : describe.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }

    @Override
    public String toString() {
        return "Dictionary{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", describe='" + describe + '\'' +
                ", number=" + number +
                ", value='" + value + '\'' +
                '}';
    }
}