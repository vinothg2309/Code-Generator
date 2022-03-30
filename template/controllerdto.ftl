package ${packageName}.controller;

import ${packageName}.entity.${entityClass};
import ${packageName}.controller.dto.${entityClass}DTO;
import ${packageName}.service.${entityClass}Service;	
import ${packageName}.common.CrudController;		

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/${entityClass?lower_case}/")
public class ${entityClass}Controller implements CrudController<${entityClass}DTO,${primaryKeyClass}>{

    @Autowired
    private ${entityClass}Service service;

    @Autowired
	private ModelMapper modelMapper;

    @Override
    public ResponseEntity<${entityClass}DTO> create(@RequestBody ${entityClass}DTO dto) {
       ${entityClass} entity = modelMapper.map(dto, ${entityClass}.class);
       entity = service.create(entity);
       return ResponseEntity.ok(modelMapper.map(entity, ${entityClass}DTO.class));
    }

    @Override
    public ResponseEntity<${entityClass}DTO> update(@RequestBody ${entityClass}DTO dto) {
      ${entityClass} entity = modelMapper.map(dto, ${entityClass}.class);
       entity = service.update(entity);
       return ResponseEntity.ok(modelMapper.map(entity, ${entityClass}DTO.class));
    }

    @Override
    public ResponseEntity<Page<${entityClass}DTO>> read(
            @RequestBody ${entityClass}DTO dto,
            @RequestParam("page") Integer page,
            @RequestParam("size") Integer size) {
        Pageable pageable = PageRequest.of(page,size);
        ${entityClass} entity = modelMapper.map(dto, ${entityClass}.class);
        Page<${entityClass}DTO> pages = service.read(entity, pageable).map(e -> modelMapper.map(e, ${entityClass}DTO.class));
        return ResponseEntity.ok(pages);
    }

    @Override
    public ResponseEntity<${entityClass}DTO> readOne(@PathVariable("id") ${primaryKeyClass} primaryKey) {
         ${entityClass} entity = service.readOne(primaryKey);
         return ResponseEntity.ok(modelMapper.map(entity, ${entityClass}DTO.class));
    }

    @Override
    public void delete(${primaryKeyClass} primaryKey) {
        service.delete(primaryKey);
    }
}
