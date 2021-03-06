package com.example.demo.entity;
// Generated 7 Nov, 2021 1:04:35 PM by Hibernate Tools 5.4.11.Final


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Studentclassrelation generated by hbm2java
 */
@Entity
@Table(name="STUDENTCLASSRELATION"
    ,schema="PUBLIC"
    ,catalog="TESTDB"
    , uniqueConstraints = @UniqueConstraint(columnNames={"STUDENTID", "CLASSID"}) 
)
public class Studentclassrelation  implements java.io.Serializable {


     private StudentclassrelationId id;
     private Student student;
     private StudentClass studentClass;

    public Studentclassrelation() {
    }

    public Studentclassrelation(StudentclassrelationId id, Student student, StudentClass studentClass) {
       this.id = id;
       this.student = student;
       this.studentClass = studentClass;
    }
   
     @EmbeddedId

    
    @AttributeOverrides( {
        @AttributeOverride(name="studentid", column=@Column(name="STUDENTID", nullable=false) ), 
        @AttributeOverride(name="classid", column=@Column(name="CLASSID", nullable=false) ) } )
    public StudentclassrelationId getId() {
        return this.id;
    }
    
    public void setId(StudentclassrelationId id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="STUDENTID", nullable=false, insertable=false, updatable=false)
    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="CLASSID", nullable=false, insertable=false, updatable=false)
    public StudentClass getStudentClass() {
        return this.studentClass;
    }
    
    public void setStudentClass(StudentClass studentClass) {
        this.studentClass = studentClass;
    }




}


