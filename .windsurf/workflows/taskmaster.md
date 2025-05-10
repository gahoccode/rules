---
description: This workflow automates project setup and task breakdown while maintaining clear progress tracking. 
---

# Project Management Workflow with Taskmaster

1. **Initialize the Project with Taskmaster**
   - Create a new project directory
   - Run `taskmaster init` in the project directory
   - Define your project requirements in the prompt when taskmaster asks for them
   - Review the generated project structure

2. **Analyze Project Complexity**
   - Run `taskmaster analyze` on your requirements document
   - Review the complexity assessment
   - Run `taskmaster generate-subtasks` to break down complex tasks
   - Organize the generated subtasks in priority order

3. **Task Management Process**
   - Start each task with `taskmaster start <task-id>`
   - Work on the task according to specifications
   - When complete, run `taskmaster finish <task-id>`
   - Set the appropriate status with `taskmaster status <task-id> "Completed"`

4. **Implement Changelog Tracking**
   - Create a CHANGELOG.md file in the project root
   - Structure with checkbox items for each task:
     ```markdown
     # Changelog

     ## [Unreleased]
     - [ ] Task 1: Initial setup
     - [ ] Task 2: Core functionality
     ```
   - Update checkboxes to `[x]` when tasks are completed
   - Add notes about implementation details or changes under each task

5. **Configure .gitignore for Task Testing**
   - Locate the .gitignore file in your project root
   - Find and remove the line containing `tasks/` or similar task directory exclusions
   - Add a comment explaining why tasks are being tracked:
     ```
     # Temporarily tracking tasks/ directory for testing and reference purposes
     # tasks/  <-- commented out to allow tracking
     ```
   