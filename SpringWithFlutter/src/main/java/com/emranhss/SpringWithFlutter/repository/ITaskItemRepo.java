package com.emranhss.SpringWithFlutter.repository;

import com.emranhss.SpringWithFlutter.model.TaskItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ITaskItemRepo extends JpaRepository<TaskItem, Long> {

}
