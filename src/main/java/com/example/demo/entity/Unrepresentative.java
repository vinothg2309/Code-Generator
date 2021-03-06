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
 * Unrepresentative generated by hbm2java
 */
@Entity
@Table(name="UNREPRESENTATIVE"
    ,schema="PUBLIC"
    ,catalog="TESTDB"
)
public class Unrepresentative  implements java.io.Serializable {


     private Integer pkUnrepresentativeId;
     private Country country;
     private String gender;
     private String name;

    public Unrepresentative() {
    }

	
    public Unrepresentative(Country country) {
        this.country = country;
    }
    public Unrepresentative(Country country, String gender, String name) {
       this.country = country;
       this.gender = gender;
       this.name = name;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="PK_UNREPRESENTATIVE_ID", unique=true, nullable=false)
    public Integer getPkUnrepresentativeId() {
        return this.pkUnrepresentativeId;
    }
    
    public void setPkUnrepresentativeId(Integer pkUnrepresentativeId) {
        this.pkUnrepresentativeId = pkUnrepresentativeId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="FK_COUNTRY_ID", nullable=false)
    public Country getCountry() {
        return this.country;
    }
    
    public void setCountry(Country country) {
        this.country = country;
    }

    
    @Column(name="GENDER", length=100)
    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }

    
    @Column(name="NAME", length=100)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }




}


