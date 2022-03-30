package ${packageName}.${entityClass?lower_case}.controller;

import ${packageName}.entity.${entityClass};
import ${packageName}.${entityClass?lower_case}.service.${entityClass}Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/${entityClass?lower_case}")
public class ${entityClass}Controller{

    @Autowired
    private ${entityClass}Service service;

    @PostMapping(path = "/save")
    public ResponseEntity<${entityClass}> create(@RequestBody ${entityClass} entity) {
        return ResponseEntity.ok(service.create(entity));
    }

    @PutMapping(path = "/update")
    public ResponseEntity<${entityClass}> update(@RequestBody ${entityClass} entity) {
        return ResponseEntity.ok(service.update(entity));
    }

    @PostMapping("/fetch")
    public ResponseEntity<Page<${entityClass}>> read(
            @RequestBody ${entityClass} entity,
            @RequestParam("page") Integer page,
            @RequestParam("size") Integer size) {
        Pageable pageable = PageRequest.of(page,size);
        return ResponseEntity.ok(service.read(entity,pageable));
    }

    @GetMapping("/fetchById/{id}")
    public ResponseEntity<${entityClass}> readOne(@PathVariable("id") ${primaryKeyClass} primaryKey) {
        return ResponseEntity.ok(service.readOne(primaryKey));
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable("id") ${primaryKeyClass} primaryKey) {
        service.delete(primaryKey);
    }
}
