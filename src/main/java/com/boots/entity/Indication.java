package com.boots.entity;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "t_indication")
public class Indication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "Пустое значение")
    @Min(value = 1, message = "Значение должно быть больше 0")
    private Integer indication;

    private String sendDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User users;

    public Indication(Long id, Integer indication, String sendDate) {
        this.id = id;
        this.indication = indication;
        this.sendDate = sendDate;
    }

    public Indication() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getIndication() {
        return indication;
    }

    public void setIndication(Integer indication) {
        this.indication = indication;
    }

    public String getSendDate() {
        return sendDate;
    }

    public void setSendDate(String sendDate) {
        this.sendDate = sendDate;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Indication{" +
                "id=" + id +
                ", indication=" + indication +
                ", sendDate='" + sendDate + '\'' +
                ", users=" + users +
                '}';
    }
}
