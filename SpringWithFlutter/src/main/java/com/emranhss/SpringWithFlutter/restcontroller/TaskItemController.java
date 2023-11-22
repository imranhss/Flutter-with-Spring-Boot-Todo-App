package com.emranhss.SpringWithFlutter.restcontroller;


import com.emranhss.SpringWithFlutter.model.TaskItem;
import com.emranhss.SpringWithFlutter.repository.ITaskItemRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
public class TaskItemController {

    @Autowired
    ITaskItemRepo taskRepo;

    @GetMapping("/alltask")
    public List<TaskItem> getTask() {
        return  taskRepo.findAll();
    }

    @PostMapping("/addtask")
    public  TaskItem addTask(@RequestBody TaskItem t){
        return  taskRepo.save(t);
    }


    @PutMapping("/update/{id}")
    public ResponseEntity updateTask(@PathVariable("id") Long id){
        boolean exist=taskRepo.existsById(id);
        if(exist){
            TaskItem task=taskRepo.getById(id);
            boolean done = task.isDone();
            task.setDone(!done);

            taskRepo.save(task);
            return  new ResponseEntity<>("Task is Updated", HttpStatus.OK);
        }
        return  new ResponseEntity<>("Task is not Exist", HttpStatus.BAD_REQUEST);
    }

    @DeleteMapping("/delete/{id}")
    public  ResponseEntity deleteTask(@PathVariable("id") Long id){

        boolean exist=taskRepo.existsById(id);
        if(exist){
            taskRepo.deleteById(id);
            return  new ResponseEntity<>("Task is deleted", HttpStatus.OK);
        }
        return  new ResponseEntity<>("Task is not exist", HttpStatus.BAD_REQUEST);
    }

}

