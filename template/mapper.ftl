package ${packageName}.service.mapper;

import ${packageName}.entity.${entityClass};
import ${packageName}.controller.dto.${entityClass}DTO;
import org.mapstruct.Mapper;


@Mapper(componentModel = "spring")
public interface ${entityClass}Mapper {

    ${entityClass} toEntity(${entityClass}DTO dto);

    ${entityClass}DTO toDto(${entityClass} entity);

}