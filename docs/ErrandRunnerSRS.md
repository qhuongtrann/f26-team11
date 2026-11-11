# Requirements – Starter Template


**Project Name:** ErrandRunner \
**Team:** Joyce Tran - Provider/Runner, Jessie Bernardino-Dominguez - Customer \
**Course:** CSC 340\
**Version:** 1.0\
**Date:** 2026-09-18


---


## 1. Overview
**Vision.** One or two sentences: ErrandRunner is a web platform connecting neighborhood residents who need minor chores completed with nearby local providers/runners looking to earn some extra income.


**Glossary** Terms used in the project
- **Customer:** The user who needs help with some chores and posts an errand task.
- **Provider/Runner:** The runner who accepts and executes the errand task.


**Primary Users / Roles.**
- **Customer** — Create/modify profile, request errand services, set up recurring subscriptions, and leave provider reviews.
- **Runner** — Browse open errands, accept/decline task, update order status, view customer statistics.




**Scope (this semester).**
- User profiles (Customers & Runner)
- Create, edit, and cancel errand requests (Customer)
- Browse and search avalable errands by category (Runner)
- Claiming and accepting errand requests (Runner)
- Status update (Pending, In-progress, Completed) (Runner)
- Proof of dropoff/completed confirmation (Runner)
- Reviews and ratings (Customer)


**Out of scope (deferred).**
- In-app chat/messaging
- Handling electronic payments within the app
- Multi-stop/destination routing algorithm
- In-app direct calling


> This document is **requirements‑level** and solution‑neutral; design decisions (UI layouts, API endpoints, schemas) are documented separately.


---


## 2. Functional Requirements (User Stories)
Write each story as: **As a `<role>`, I want `<capability>`, so that `<benefit>`.** Each story includes at least one **Given/When/Then** scenario.


### 2.1 Customer Stories
- **US‑1 — User Profile**  
  _Story:_ As a customer, I want to create a user profile so that I can place orders  
  _Acceptance:_
  ```gherkin
  Scenario: Making a profile
    Given a customer is new to the application
    When they open the application they are opted to make a profile.
    Then they fill out the information needed to make an account.
  ```


- **US‑2 — Customer Reviews**  
  _Story:_ As a customer, I want to leave a review so that runners can receive feedback.
  _Acceptance:_
  ```gherkin
  Scenario: Errand/Chore has been completed
    Given a runner has done the task well
    When the customer goes to the application they are prompted to leave a review.
    Then  they can leave a review out of 5 stars and optional commentary
  ```
- **US‑3 — Place Order**  
  _Story:_ As a customer, I want to place an order, so it can be fulfilled.  
  _Acceptance:_
  ```gherkin
  Scenario: Placing an order.
    Given a customer is in need of an order
    When they open the application they are opted to place an order.
    Then they fill out the information needed for tneir order.
  ```


- **US‑4 — Cancel my order**  
  _Story:_ As a customer, I want to cancel an order so that I can change it or in case I've changed my mind.
  _Acceptance:_
  ```gherkin
  Scenario: Cancelling an order
    Given a customer has changed their mind
    When the customer goes to their order, they are opted to cancel if need be.
    Then  they can change their order or out right not place an order.
  ```

### 2.2 Provider Stories
- **US-20 — Runner Profile Management**  
  _Story:_ As a runner, I want to create and manage my runner profile so that I can participate in the ErrandRunner platform and claim available errands.
  _Acceptance:_
  ```gherkin
  Scenario: Creating a runner profile
    Given a new runner wants to join the platform
    When  they submit their registration information
    Then  a runner profile is created and stored in the database

  Scenario: Updating a runner profile
    Given a runner already has a profile
    When they update their profile information
    Then the updated information is saved successfully
  ```


- **US-21 — Browse & Filter Available Tasks**  
  _Story:_ As a runner, I want to browse available errands and filter them by category so that I can find tasks that match my interests and availability.
  _Acceptance:_
  ```gherkin
  Scenario: Viewing available errands
    Given open errands exist in the system
    When a runner requests the list of errands
    Then all available errands are displayed

  Scenario: Filtering errands by category
    Given errands exist in multiple categories
    When a runner filters errands by category
    Then only errands matching the selected category are returned
  ```


- **US-22 — View Task Details & Compensation**  
  _Story:_ As a runner, I want to view the details and compensation of each errand before claiming it so that I can decide whether to accept the task. 
  _Acceptance:_
  ```gherkin
  Scenario: Viewing task details
    Given a runner is browsing available errands
    When the runner selects an errand
    Then the task description, location, category, and compensation are displayed

  Scenario: Viewing compensation
    Given an errand is available
    When a runner views the errand details
    Then the compensation amount is displayed
  ```


- **US-23 — Claim an Errand**  
  _Story:_ As a runner, I want to claim an available errand so that I can complete the task and prevent duplicate claims by other runners.  
  _Acceptance:_
  ```gherkin
  Scenario: Claiming an available task
    Given an errand is available
    When a runner claims the errand
    Then the task is assigned to that runner
    And the task status changes to CLAIMED

  Scenario: Viewing claimed tasks
    Given a runner has claimed errands
    When the runner views their claimed tasks
    Then all assigned errands are displayed
  ```


- **US-24 — Update Task Status**  
  _Story:_ As a runner, I want to update the status of an assigned errand so that customers can track the progress of the task.
  _Acceptance:_
  ```gherkin
  Scenario: Updating task progress
    Given a runner has claimed an errand
    When the runner updates the task status
    Then the updated status is saved in the database

  Scenario: Completing a task
    Given a runner has finished an errand
    When the runner marks the task as completed
    Then the task status changes to COMPLETED
    And any completion notes are saved
  ```


---


## 3. Non‑Functional Requirements (make them measurable)
- **Performance:** Task listings and page loads render rapidly
- **Availability/Reliability:** The platform must maintain 99.5% operational uptime, with scheduled system maintenance communicated beforehand
- **Security/Privacy:** The application must enforce robust credential authentication and access controls, ensuring Customer and Runner profile data be securely managed and persisted in the database
- **Usability:** New Customers/Runners should be able to complete the registration process and start placing/claming orders within 5 minutes without external assistance.


---


## 4. Assumptions, Constraints, and Policies
- Users must have stable internet access and a modern browser to interact with the platform
- Monetary and task arrangements outside electronic payment handling are coordinated directly between users
- The system assumes users provided accurate location and description details when posting tasks.


---


## 5. Milestones (course‑aligned)
- **M1 Requirements** — this file + stories opened as issues.
- **M2 High‑fidelity prototype** — core customer/provider flows fully interactive.
- **M3 Design** — architecture, schema, API outline.
- **M4 Backend API** — key endpoints + tests.
- **M5 Increment** — ≥2 use cases end‑to‑end.
- **M6 Final** — complete system & documentation.


---


## 6. Change Management
- Stories are living artifacts; changes are tracked via repository issues and linked pull requests.  
- Major changes should update this SRS.
