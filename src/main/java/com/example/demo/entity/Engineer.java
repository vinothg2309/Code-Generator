package com.example.demo.entity;
// Generated 8 Nov, 2021 4:19:09 PM by Hibernate Tools 5.4.11.Final


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Engineer generated by hbm2java
 */
@Entity
@Table(name="ENGINEER"
    ,schema="PUBLIC"
    ,catalog="TESTDB"
)
public class Engineer  implements java.io.Serializable {


     private Integer pkEngineerId;
     private Car car;
     private String fullname;
     private String mobileno;

    public Engineer() {
    }

	
    public Engineer(Car car) {
        this.car = car;
    }
    public Engineer(Car car, String fullname, String mobileno) {
       this.car = car;
       this.fullname = fullname;
       this.mobileno = mobileno;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="PK_ENGINEER_ID", unique=true, nullable=false)
    public Integer getPkEngineerId() {
        return this.pkEngineerId;
    }
    
    public void setPkEngineerId(Integer pkEngineerId) {
        this.pkEngineerId = pkEngineerId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="FK_CAR_ID", nullable=false)
    public Car getCar() {
        return this.car;
    }
    
    public void setCar(Car car) {
        this.car = car;
    }

    
    @Column(name="FULLNAME", length=100)
    public String getFullname() {
        return this.fullname;
    }
    
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    
    @Column(name="MOBILENO", length=11)
    public String getMobileno() {
        return this.mobileno;
    }
    
    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }




}


