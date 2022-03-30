package ${packageName}.${entityClass?lower_case}.repository;

import ${packageName}.entity.${entityClass};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ${entityClass}Repository extends JpaRepository<${entityClass}, ${primaryKeyClass}> {

}
