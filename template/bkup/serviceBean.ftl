package ${packageName}.${entityClass}.service.impl;

import ${entityPackage}.${entityClass};
import ${entityPackage}.${entityClass}Repository;
import ${entityPackage}.${entityClass}Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
public class ${entityClass}ServiceBean implements ${entityClass}Service {

    @Autowired
    private ${entityClass}Repository repository;

    @Override
    public ${entityClass} create(${entityClass} entity) {
        return repository.save(entity);
    }

    @Override
    public ${entityClass} update(${entityClass} entity) {
        return repository.save(entity);
    }

    @Override
    public Page<${entityClass}> read(${entityClass} entity, Pageable pageable) {
        Example<${entityClass}> example = Example.of(entity);
        return repository.findAll(example,pageable);
    }

    @Override
    public ${entityClass} readOne(${primaryKeyClass} primaryKey) {
        return repository.getOne(primaryKey);
    }

    @Override
    public void delete(${primaryKeyClass} primaryKey) {
        repository.deleteById(primaryKey);
    }
}
