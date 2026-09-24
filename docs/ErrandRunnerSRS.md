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


### 2.2 Provider Stories
- **US-20 — Category Filtering**  
  _Story:_ As a runner, I want to browse open errands filtered by category so that I can find tasks matching my ability and availability.
  _Acceptance:_
  ```gherkin
  Scenario: Filtering open errands by category
    Given a runner is on the open task board
    When  they select a category filter
    Then  applying category filters returns only matching active errands
  ```


- **US-21 — Viewing Task Compensation**  
  _Story:_ As a runner, I want to view the offered fee for each requests before claiming it so that I can choose tasks matching my availability and charge.
  _Acceptance:_
  ```gherkin
  Scenario: Viewing task fee
    Given a runner views open errand listings
    When  they review the available task details
    Then  visibly displays the exact compensation amount of each task
  ```


- **US-22 — Claiming Errand Requests**  
  _Story:_ As a runner, I want to accept/claim an errand so that the other runners can know it's already been claimed  
  _Acceptance:_
  ```gherkin
  Scenario: Claiming an open errand
    Given a runner selects an available task
    When  they click accept/claim
    Then  errand status shifts from open to claimed, only one runner can claim the task, and the listing is removed from other runners' available pool.
  ```


- **US-23 — Task Status Updates & Proof of Drop-off**  
  _Story:_ As a runner, I want to update the errand status (In-Progres, Completed) and end with a drop-off/completed confirmation so that the customer can track the order's progress.  
  _Acceptance:_
  ```gherkin
  Scenario: Updating task progress and completion
    Given a runner is actively fulfilling a claimed task
    When  they change the status and submit confirmation notes
    Then  status changed, and completion notes/confirmation timestamp are saved upon finalizing the task
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
