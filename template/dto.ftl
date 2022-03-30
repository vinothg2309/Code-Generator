package ${packageName}.controller.dto;

import lombok.Data;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@Data
public class ${entityClass}DTO {

<#list entityFields as field>
    private ${field.type.name} ${field.name};
</#list>

}

