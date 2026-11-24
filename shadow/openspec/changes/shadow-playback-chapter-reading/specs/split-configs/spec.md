# Spec Delta

## ADDED Requirements

### Requirement: Prepare's sentence preview follows the shared player model
The preview offered on every sentence row in Prepare SHALL follow the shared
play/pause model of the study loop: play restarts, a secondary pause pauses
and resumes, and its playhead tracks actual playback.

#### Scenario: Preview pause in Prepare
- **WHEN** a row's preview is paused and resumed
- **THEN** playback resumes from the paused point
