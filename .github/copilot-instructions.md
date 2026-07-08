# Terraform Infrastructure Repository

## Tech Stack
- **Infrastructure**: Terraform
- **Cloud**: Azure
- **Automation**: Azure DevOps pipelines

## Project Structure
```
/terraform  - Environment-specific Terraform deployments
/pipeline   - Pipeline definitions
```

## Setup Checklist
- [x] Clarify Project Requirements
- [ ] Scaffold Terraform Structure
- [ ] Customize Terraform and Pipeline Definitions
- [ ] Install Required Extensions
- [ ] Validate Terraform Configuration
- [ ] Create and Run Task
- [ ] Create Feature Branch and PR
- [ ] Ensure Documentation is Complete

---

## Pull Request Guidelines

### PR Workflow
1. **Create a branch** from `develop` using naming convention: `feature/{task-id}-{short-description}`
2. **Make changes** following the coding standards below
3. **Submit PR** with detailed description linking to Azure DevOps task
4. **Wait for review** - NO code changes should be merged without approval
5. **Address feedback** and get final approval before merge

### PR Title Format
```
[Task #{ID}] Brief description of changes
```

### PR Description Template
```markdown
## Related Task
Azure DevOps Task: #{task-id}

## Changes Made
- List of changes

## Testing Done
- Unit tests added/updated
- Manual testing performed

## Screenshots (if UI changes)
```

### Code Review Requirements
- **MANDATORY**: All changes require at least 1 reviewer approval
- **NO direct commits** to `main` or `develop` branches
- Changes will ONLY be applied after acceptance/approval from reviewer
- Address all review comments before requesting re-review

---

## Variable Naming Conventions

### Sync with Current Task
When working on a task, use naming that reflects the task context:

| Context | Convention | Example |
|---------|------------|---------|
| Task-related variables | `task{TaskId}_{purpose}` | `task42_userInput` |
| Feature flags | `feature_{taskId}_{name}` | `feature_42_enableAuth` |
| Branch names | `feature/{taskId}-{desc}` | `feature/42-user-auth` |
| Commit messages | `[#{taskId}] message` | `[#42] Add login form` |

### General Naming Standards
| Type | Convention | Example |
|------|------------|---------|
| Variables | camelCase | `storageAccountName`, `resourceGroupName` |
| Constants | UPPER_SNAKE_CASE | `MAX_RETRIES`, `API_URL` |
| Functions | camelCase | `buildStorageName()`, `resolveWorkspaceId()` |
| Classes | PascalCase | `TerraformPlan`, `PipelineConfig` |
| Files (Terraform) | snake_case | `backend.tf`, `providers.tf` |
| Folders | PascalCase | `Prod`, `NonProd` |
| Environment vars | UPPER_SNAKE_CASE | `ARM_CLIENT_ID`, `TF_VAR_location` |

---

## Approval Workflow

### Before Making Changes
1. Ensure you have an assigned task in Azure DevOps
2. Understand the acceptance criteria
3. Create a feature branch

### During Development
1. Follow coding standards and naming conventions
2. Run focused validation such as `terraform fmt`, `terraform validate`, and targeted pipeline checks when relevant
3. Keep commits atomic and well-documented

### Before Merging
1. **STOP** - Wait for code review
2. All changes must be reviewed and approved
3. Address all feedback before final approval
4. Only merge after explicit approval from reviewer

### Post-Merge
1. Update Azure DevOps task status
2. Delete feature branch
3. Verify deployment (if applicable)

---

## Branch-First Rule (STRICT — No Exceptions)

### Every Change Requires a New Branch

**NEVER implement any change directly on `master` or `develop`.**

This rule applies to **all** of the following:
- New Terraform module folders or files
- Changes to existing Terraform files
- Pipeline YAML additions or modifications
- Any file edit in the repository

### Mandatory Branch Workflow
Before writing a single line of code or modifying any file, you MUST:
1. **Create a feature branch locally** from `master` using the naming convention:
   ```
   git checkout master
   git pull origin master
   git checkout -b feature/{task-id}-{short-description}
   ```
2. **Implement all changes** exclusively on that local feature branch
3. **Commit changes** to the local feature branch with descriptive commit messages
4. **Push the branch to remote** once all changes are committed:
   ```
   git push origin feature/{task-id}-{short-description}
   ```
5. **Never commit or push** directly to `master` or `develop`

### Enforcement
- If a task ID is available (from Azure DevOps), use it in the branch name: `feature/62-configure-unity-catalog-metastore`
- If no task ID exists, use a descriptive slug: `feature/add-unity-catalog-binding`
- **Local branch creation happens before any file is created or modified** — it is step 1, not an afterthought
- All file changes must exist only on the feature branch, never on `master` locally or remotely
- After pushing, open a PR from the feature branch to `master` and wait for review approval before merging

---

## Approval Gate (Always Required)

### Plan-First Rule (MANDATORY)
Before any implementation action, you MUST:
1. **Present a clear execution plan** - Show the user exactly what will be done step-by-step
2. **Wait for explicit GoAhead** - Do not proceed without the user replying with "GoAhead"
3. **Execute only after approval** - Start implementation only after plan confirmation

### Plan Output Format (MANDATORY)
All execution plans MUST be presented in a well-structured markdown format that mirrors the approved example style.

Required structure and order:
1. Opening sentence stating what will be created and that the execution plan is presented before proceeding.
2. `## Execution Plan` heading.
3. `### Feature: <Feature Name>` block with:
   - `Title`, `Description`, `Proposed Acceptance Criteria`, and `Priority`.
4. `---` separator.
5. `### Suggested User Stories (to be linked as children):` heading.
6. Four User Story blocks in this exact order, each with:
   - User Story name as bold heading text.
   - `Description`.
   - `Proposed Acceptance Criteria` as a checklist.
7. `---` separator.
8. Closing approval question in this exact pattern:
   - `Shall I proceed with creating the Feature and these 4 User Stories? Please reply with "GoAhead" to proceed, or let me know if you'd like to modify any details first.`

Formatting rules:
- Use markdown headings exactly as defined above (`##`, `###`).
- Use horizontal separators (`---`) between major sections.
- Use clear checklist bullets for acceptance criteria in Feature and all User Stories.
- For `Type: Feature`, always include all 4 standard User Stories.
- Always mark User Story 4 as `*(MANDATORY)*` and include explicit CI/CD automation acceptance criteria.
- Do not use tables.

Template for `Type: Feature` requests:

I'll create a Feature work item for "<feature title>" in the <Env> environment. Let me first present the execution plan with the Feature and the 4 suggested User Stories before proceeding.

## Execution Plan

### Feature: <Feature Title>
**Title:** <Feature Title>
**Description:** <Feature Description>
**Proposed Acceptance Criteria:**

- <criterion 1>
- <criterion 2>
- <criterion 3>
- <criterion 4>
- <criterion 5>

**Priority:** 2

---

### Suggested User Stories (to be linked as children):
**User Story 1: Infrastructure Setup & Configuration**

- **Description:** <description>
- **Proposed Acceptance Criteria:**
  - <criterion 1>
  - <criterion 2>
  - <criterion 3>
  - <criterion 4>

**User Story 2: Integration & Cross-Module Connectivity**

- **Description:** <description>
- **Proposed Acceptance Criteria:**
  - <criterion 1>
  - <criterion 2>
  - <criterion 3>
  - <criterion 4>

**User Story 3: Pipeline & Deployment Configuration**

- **Description:** <description>
- **Proposed Acceptance Criteria:**
  - <criterion 1>
  - <criterion 2>
  - <criterion 3>
  - <criterion 4>

**User Story 4: CI/CD Implementation & Automation** *(MANDATORY)*

- **Description:** <description>
- **Proposed Acceptance Criteria:**
  - <criterion 1>
  - <criterion 2>
  - <criterion 3>
  - <criterion 4>
  - <criterion 5>

---

**Shall I proceed with creating the Feature and these 4 User Stories?** Please reply with **"GoAhead"** to proceed, or let me know if you'd like to modify any details first.

This applies to:
- Creating/modifying work items in Azure DevOps
- Editing any files in the repository
- Running commands or validating changes
- Creating branches, PRs, or commits
- Any other change that affects the codebase or project state

**Exception**: Non-destructive read operations (file reads, searches, inspections) do not require a plan.

---

## Prompt Guidelines & Request Processing

### Allowed Request Types

Only accept requests that match the exact format below. Reject all other formats.

1. **Create Feature + User Stories**
   - Requires: Feature title, description, acceptance criteria
   - Requires: N User Stories with title, description, acceptance criteria
   - Mandatory: Feature acceptance criteria MUST be present before creating the Feature
   - Mandatory: Every User Story acceptance criteria MUST be present before creating the User Story
   - Mandatory: Every User Story MUST be linked to Feature as child (parent-child hierarchy)

2. **Create Terraform Feature + Folder Structure**
   - For infrastructure/Terraform-related Features ONLY
   - Requires: Feature title, description, optional environment (NonProd/Prod, defaults to NonProd)
   - Mandatory: Create complete Terraform module folder with all 7 files:
     - `versions.tf`, `backend.tf`, `providers.tf`, `remote.tf`, `variables.tf`
     - Resource file: `main.tf` OR `feature.tf` OR domain-specific name
     - `outputs.tf`
   - Folder must be created in `terraform/{Env}/{feature-name}` (where Env is NonProd or Prod)
   - All files must pass `terraform fmt`, `terraform validate`, `tflint`, `tfsec`
   - Must update `pipeline/terraform-build.yml` matrix to include new folder path

3. **Create Pipeline for Feature**
   - For pipeline/CI-CD automation related to features
   - Requires: Pipeline name, purpose, trigger configuration, validation steps
   - Mandatory: Create complete pipeline file with all 7 components:
     - Metadata, Trigger config, PR config, Environment config, Stages, Validation steps, Success criteria
   - File must be created in `pipeline/` or `pipeline/{environment}/` directory
   - YAML syntax must be valid
   - Must include all validation steps: terraform fmt, validate, tflint, tfsec

4. **Link User Stories to Feature** 
   - Only when implementing mandatory linking rules
   - Verify parent Feature exists before linking

### Type-to-Action Contract (Strict)

The `Type` field is the single source of truth for what to create.

- `Type: UserStory` -> Create a User Story only in Azure DevOps
- `Type: Feature` -> Create a Feature only in Azure DevOps
- `Type: Task` -> Create a Task only in Azure DevOps
- `Type: Bug` -> Create a Bug only in Azure DevOps
- `Type: Issue` -> Create a Bug in Azure DevOps by default (unless user explicitly requests a different work item type mapping)
- `Type: Terraform` -> Create Terraform code/folder structure only
- `Type: Pipeline` -> Create Pipeline YAML only

Never infer a different action from keywords in `Description`.

### Implementation Target Selection (MANDATORY)

For implementation requests (code, pipeline, repository, branch, PR, or file-level changes), always ask the user where implementation should happen before making changes.

- Ask exactly: `Where do you want implementation: GitHub repo or Azure DevOps repo?`
- If user selects GitHub repo, perform implementation actions only in GitHub context.
- If user selects Azure DevOps repo, perform implementation actions only in Azure DevOps repo context.
- If user does not provide a platform, do not proceed with implementation actions.
- Do not assume implementation platform based on wording in description.
- Work item creation remains Azure DevOps-only for `Feature`, `UserStory`, `Task`, `Bug`, and `Issue`.

### Cross-Repository Context Check (MANDATORY)

When handling `Type: Terraform` or `Type: Pipeline`, perform a cross-repository context check before implementation.

Rules:
- Treat this repository as the primary source of truth for behavior, naming conventions, guardrails, and expected outputs.
- Check relevant patterns from other repositories in the workspace or organization only when they improve accuracy, consistency, or reduce duplication.
- Do not override this repository's constraints with external patterns.
- Explicitly state assumptions when referencing external repositories (for example: provider versions, pipeline templates, module layout conventions).
- Keep output backward-compatible with current repository behavior unless the user explicitly requests a behavior change.
- If no additional repositories are accessible, continue with repository-local implementation and note that cross-repo context was unavailable.

### Response Template For Terraform/Pipeline (RECOMMENDED)

Use this concise response structure when cross-repository context is used:

```markdown
Cross-Repo Sources Checked:
- <repo/path 1 or "None available"> 
- <repo/path 2>

Assumptions:
- <assumption about versions/templates/conventions>
- <assumption about environment/tooling compatibility>

Repository Priority Confirmation:
- Current repository rules and expected outputs were kept as the source of truth.
```

If no cross-repo source is available, explicitly state:
- `Cross-Repo Sources Checked: None available in current workspace/org context.`
- `Proceeding with repository-local defaults and existing standards.`

### Acceptance Criteria And Priority Policy (STRICT)

For every Azure DevOps work item created or updated in this repository context (Feature, User Story, Task, Bug, Issue), the following fields are mandatory:

- `System.Title`
- `System.Description`
- `Microsoft.VSTS.Common.AcceptanceCriteria`
- `Microsoft.VSTS.Common.Priority`

Implementation rules:

- Always set `System.Title` from the user's description/title intent.
- Always set `System.Description` with clear scope.
- Always set `Microsoft.VSTS.Common.AcceptanceCriteria` as a measurable checklist.
- Always set `Microsoft.VSTS.Common.Priority` as an integer priority value.
- If the user does not provide acceptance criteria, auto-generate concise acceptance criteria from the description.
- If the user does not provide priority, default to `2`.
- If the user provides a priority, use the user-provided value.
- Do not complete work item creation/update until acceptance criteria and priority are both present.
- For `Feature` and `User Story`, acceptance criteria are a hard gate and must be explicitly shown in the plan before creation.
- For `Feature` and `User Story`, never create the item with a blank, omitted, or placeholder acceptance criteria field.
- For `Feature` and `User Story`, if multiple items are being created, each item must receive its own acceptance criteria rather than reusing one generic sentence.
- For `Feature` specifically: Always suggest 4 standard User Stories (Infrastructure Setup, Integration, Pipeline Configuration, CI/CD Implementation) with individual acceptance criteria before asking for `GoAhead`. Each User Story must be created individually and linked as a child to the parent Feature.

### Required Input Format

**For Feature / UserStory / Task / Bug:**
```
Type: Feature | UserStory | Task | Bug
Description: {brief description of the item to be created}
Env: NonProd | Prod (REQUIRED)
```

**For Terraform:**
```
Type: Terraform
Description: {brief description of the terraform code to create}
Resource File: {main.tf | catalog.tf | storage.tf | compute.tf | or domain-specific name}
Env: NonProd | Prod (REQUIRED)
```

**All fields are mandatory: Type, Description, and Env.**

### Type Parsing Rules

- Type matching is case-insensitive.
- The values `UserStory` and `User Story` are treated as the same type.
- The values `Issue` and `issue` are treated as Bug by default unless the user explicitly provides another mapping.
- Env matching is case-insensitive.
- **For Type: Feature, CI/CD Implementation & Automation User Story is always required and must be created individually and linked to the Feature**
- If an unsupported type is provided, reject the request.
- **MANDATORY: Env parameter is required for all work item types and Terraform requests. Requests without Env must be rejected.**

### Rejection Response

If the request does not match this format, respond with:

```
Please use the required input format:

For Feature / UserStory / Task / Bug:
  Type: Feature | UserStory | Task | Bug
  Description: {brief description}
  Env: NonProd | Prod (REQUIRED)

For Terraform:
  Type: Terraform
  Description: {brief description of terraform code}
  Resource File: {main.tf | catalog.tf | storage.tf | or domain-specific name}
  Env: NonProd | Prod (REQUIRED)

All fields are mandatory. Env parameter must be provided.
```

### Enforcement Logic

1. **On every request**: Check if it matches the allowed types above
2. **Validate Env parameter**: Env is REQUIRED for all work item types and Terraform requests. REJECT if missing.
3. **Route work item types to Azure DevOps**:
   - For `Feature`, `UserStory`, `Task`, `Bug`, and `Issue`, create/update work items only in Azure DevOps.
   - Do not create these work items in GitHub.
4. **For implementation requests**:
   - Ask the user: `Where do you want implementation: GitHub repo or Azure DevOps repo?`
   - Proceed only after explicit platform selection from the user.
   - Apply implementation changes only on the selected platform.
5. **If Feature**: 
   - Create the Feature work item in Azure DevOps
   - Auto-suggest 4 User Stories with full descriptions and acceptance criteria (see below for standard User Stories)
   - Present the plan with all 4 suggested User Stories before asking for `GoAhead`
   - **IMPORTANT: User Story #4 (CI/CD Implementation & Automation) is MANDATORY - explicitly show it in the plan**
   - Wait for user approval before creating User Stories
   - Upon approval, create each User Story individually with their acceptance criteria in Azure DevOps
   - Link each User Story to the parent Feature as a child
   - **VALIDATION: After all User Stories are created, explicitly verify User Story #4 (CI/CD Implementation & Automation) was successfully created and linked**
   - **If CI/CD User Story is missing, the Feature implementation is INCOMPLETE and CANNOT be considered done**
6. **If User Story**:
   - Require a parent Feature link (check if Feature exists first)
   - If no Feature exists, create a Feature first in Azure DevOps, then create the User Story and link it
   - Proceed with User Story creation workflow
7. **If Terraform**: 
   - Infer feature folder name from Description
   - Use `Env` parameter to determine folder: `terraform/{Env}/{feature-name}` (e.g., `terraform/NonProd/sql-warehouse`)
   - Create all 7 mandatory files: `versions.tf`, `backend.tf`, `providers.tf`, `remote.tf`, `variables.tf`, the named resource file, `outputs.tf`
   - Use the exact resource file name provided in the `Resource File` field
   - Run `terraform fmt` on all files
   - Update `pipeline/terraform-build.yml` matrix to include new folder path
   - Verify Terraform validation will pass (fmt, validate, tflint, tfsec)
8. **If Pipeline Creation**:
   - Create pipeline file in `pipeline/` or `pipeline/{Env}/` directory
   - Include all 7 mandatory components
   - Verify YAML syntax is valid
   - Verify trigger paths match Terraform folder structure and respect Env parameter
   - Ensure all validation steps present
9. **For Feature/User Story/Task/Bug/Issue**:
   - Require `System.Title`, `System.Description`, `Microsoft.VSTS.Common.AcceptanceCriteria`, and `Microsoft.VSTS.Common.Priority`
   - If acceptance criteria is missing, auto-generate it from description before create/update
   - If priority is missing, set priority to `2`
   - Block completion if acceptance criteria or priority is still missing
10. **For Feature/User Story specifically**:
   - Show the proposed acceptance criteria in the execution plan before asking for `GoAhead`
   - On approval, send `Microsoft.VSTS.Common.AcceptanceCriteria` in the create request for every Feature and every User Story
   - Do not use bulk child-item creation paths that cannot set acceptance criteria per item
   - If the available tool cannot set acceptance criteria for child items, create each User Story individually and then link it to the parent Feature
11. **If input does not match the required format**: Reject and show the required format
12. **On linking**: Verify parent Feature exists and enforce parent-child relations
13. **Cross-repository check for Terraform/Pipeline**:
   - Before implementation, inspect available repository-local patterns first.
   - If other repositories are accessible, compare naming, module/pipeline structure, and validation patterns.
   - Apply only compatible patterns and document assumptions in the response.
   - If cross-repo data is not accessible, explicitly continue with repository-local defaults.

### Auto-Suggested User Stories for Features

When creating a Feature, automatically suggest these 4 standard User Stories (customized based on feature context and Env parameter):

**User Story 1: Infrastructure Setup & Configuration**
- Description: Configure and deploy infrastructure components using Terraform in {Env} environment
- Acceptance Criteria: All Terraform files created, validation passes (fmt, validate, tflint, tfsec), backend/remote state configured

**User Story 2: Integration & Cross-Module Connectivity**
- Description: Establish connections and integrations with existing infrastructure modules
- Acceptance Criteria: Integration with related modules complete, output variables defined, integration tests pass, documentation updated

**User Story 3: Pipeline & Deployment Configuration**
- Description: Add infrastructure module to CI/CD pipeline and update build matrix
- Acceptance Criteria: Pipeline YAML updated, build matrix includes new folder, PR validation triggers correctly, deployment steps configured

**User Story 4: CI/CD Implementation & Automation**
- Description: Set up comprehensive CI/CD workflows to automate deployment and validation in {Env} environment
- Acceptance Criteria: Automated validation on commits, deployment to {Env} on PR merge, rollback procedures documented and tested, pipeline notifications configured, security scanning integrated

### Mandatory CI/CD User Story Rule (CRITICAL)

**CI/CD Implementation & Automation (User Story #4) is NON-NEGOTIABLE and MANDATORY for every Feature created.**

Enforcement rules:
- **MUST be created individually** - Do NOT skip or defer CI/CD User Story creation
- **MUST be linked to parent Feature** - Every Feature must have CI/CD Implementation as a child User Story
- **DO NOT proceed** with Feature creation unless User Story #4 (CI/CD Implementation & Automation) is successfully created and linked
- **Validation checkpoint**: After Feature + all 4 User Stories are created, explicitly verify User Story #4 was created and linked
- **Non-compliance blocks work**: If CI/CD User Story is missing, the Feature implementation is incomplete and cannot be considered done

This applies to **ALL Features without exception**, regardless of context or environment.

---

## Guardrails

### Pre-Authorized Routine Actions
The following actions are pre-approved and do not require an extra confirmation when they are within the requested task scope:
- Read repository files and inspect project structure
- Edit documentation, skill files, pipeline files, and Terraform files except restricted paths
- Run non-destructive commands such as `git status`, `git diff`, `terraform fmt`, `terraform validate`, and targeted search or read commands
- Create feature branches from `master` or `develop`
- Stage, commit, and push task-related changes to the current feature branch
- Create or update pull requests, labels, and reviewers when permissions allow
- Use Azure DevOps or git tooling for non-destructive repository and PR workflow actions

### Protected Operations
The following operations require explicit user confirmation:
- **File deletion** - NEVER delete files without user approval
- **Production-impacting configuration changes** - Verify impact before modifying
- **Dependency updates** - Check for breaking changes
- **Secret or credential handling** - Never proceed without explicit approval

### Restricted Paths
Do NOT modify without explicit permission:
- `.env` files (contains secrets)
- `terraform/**/backend.tf` (state backend configuration)
- `terraform/**/remote.tf` (remote state wiring)
- `package-lock.json` (dependency lock file - auto-generated)
- Production configuration files

### Safe Defaults
- Prefer focused edits over broad refactors
- Always confirm destructive operations before applying them
- Keep changes scoped to the requested task and validate touched areas
- Surface permission blockers or policy conflicts clearly instead of guessing
