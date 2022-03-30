package com.example.demo.entity;
// Generated 8 Nov, 2021 4:19:09 PM by Hibernate Tools 5.4.11.Final


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TblEmployees generated by hbm2java
 */
@Entity
@Table(name="TBL_EMPLOYEES"
    ,schema="PUBLIC"
    ,catalog="TESTDB"
)
public class TblEmployees  implements java.io.Serializable {


     private Integer id;
     private String email;
     private String firstName;
     private String lastName;

    public TblEmployees() {
    }

	
    public TblEmployees(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
    public TblEmployees(String email, String firstName, String lastName) {
       this.email = email;
       this.firstName = firstName;
       this.lastName = lastName;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="EMAIL", length=250)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="FIRST_NAME", nullable=false, length=250)
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    
    @Column(name="LAST_NAME", nullable=false, length=250)
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }




}

