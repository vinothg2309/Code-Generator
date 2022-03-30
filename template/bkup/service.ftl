package ${packageName}.${entityClass?lower_case}.service;

import ${packageName}.entity.${entityClass};
import ${packageName}.${entityClass?lower_case}.repository.${entityClass}Repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ${entityClass}Service{

    @Autowired
    private ${entityClass}Repository repository;

    
    public ${entityClass} create(${entityClass} entity) {
        return repository.save(entity);
    }

    
    public ${entityClass} update(${entityClass} entity) {
        return repository.save(entity);
    }

    
    public Page<${entityClass}> read(${entityClass} entity, Pageable pageable) {
        Example<${entityClass}> example = Example.of(entity);
        return repository.findAll(example,pageable);
    }

    
    public ${entityClass} readOne(${primaryKeyClass} primaryKey) {
        return repository.findById(primaryKey).get();
    }

    
    public void delete(${primaryKeyClass} primaryKey) {
        repository.deleteById(primaryKey);
    }
}
