% Define symptoms, problems, and solutions
symptom(problem(login_failed), wrong_password).
symptom(problem(login_failed), user_not_found).
symptom(problem(crash), unexpected_error).
symptom(problem(crash), memory_overflow).
symptom(problem(slow_performance), high_cpu_usage).
symptom(problem(slow_performance), insufficient_ram).
symptom(problem(connectivity_issue), network_unreachable).
symptom(problem(connectivity_issue), server_not_responding).
symptom(problem(hardware_issue), disk_failure).
symptom(problem(hardware_issue), overheating).
symptom(problem(printer_issue), paper_jam).
symptom(problem(printer_issue), low_ink).
symptom(problem(display_issue), flickering_screen).
symptom(problem(display_issue), distorted_graphics).
symptom(problem(application_issue), freezing).
symptom(problem(application_issue), feature_not_working).
symptom(problem(security_issue), virus_detected).
symptom(problem(security_issue), unauthorized_access_attempt).
symptom(problem(email_issue), unable_to_send).
symptom(problem(email_issue), not_receiving_emails).
symptom(problem(browser_issue), page_not_loading).
symptom(problem(browser_issue), browser_crash).
symptom(problem(data_loss_issue), accidental_deletion).
symptom(problem(data_loss_issue), corrupted_files).
symptom(problem(power_issue), sudden_shutdown).
symptom(problem(power_issue), battery_not_charging).
symptom(problem(peripheral_issue), keyboard_not_working).
symptom(problem(peripheral_issue), mouse_disconnecting).
symptom(problem(audio_issue), no_sound).
symptom(problem(audio_issue), distorted_audio).
symptom(problem(update_issue), update_failure).
symptom(problem(update_issue), update_causing_issues).
% Add more problems, symptoms, and solutions here

solution(problem(login_failed), 'Check your username and password and try again.').
solution(problem(login_failed), 'Reset your password or contact support.').
solution(problem(crash), 'Restart the software. If the problem persists, reinstall the software.').
solution(problem(slow_performance), 'Close unnecessary programs and increase your RAM.').
solution(problem(connectivity_issue), 'Check your network connection and try reconnecting.').
solution(problem(hardware_issue), 'Check if the disk is failing or the system is overheating.').
solution(problem(printer_issue), 'Clear the paper jam or refill the ink cartridge.').
solution(problem(display_issue), 'Adjust the screen resolution or update the graphics driver.').
solution(problem(application_issue), 'Update the application to the latest version.').
solution(problem(application_issue), 'Check for any conflicting plugins or extensions.').
solution(problem(security_issue), 'Run a full system scan using an updated antivirus program.').
solution(problem(security_issue), 'Change your passwords and review access logs for unauthorized attempts.').
solution(problem(email_issue), 'Check your email settings and try sending again.').
solution(problem(email_issue), 'Check your email client for filters or rules blocking incoming emails.').
solution(problem(browser_issue), 'Clear your browser cache and cookies or try a different browser.').
solution(problem(browser_issue), 'Update your browser to the latest version.').
solution(problem(data_loss_issue), 'Attempt file recovery using data recovery software.').
solution(problem(data_loss_issue), 'Restore from backup if available.').
solution(problem(power_issue), 'Check power connections and ensure proper ventilation.').
solution(problem(power_issue), 'Replace the battery or check the power adapter.').
solution(problem(peripheral_issue), 'Reconnect the keyboard or try a different port.').
solution(problem(peripheral_issue), 'Check for driver updates for the mouse.').
solution(problem(audio_issue), 'Check audio settings and ensure speakers or headphones are properly connected.').
solution(problem(audio_issue), 'Update audio drivers or try a different audio output device.').
solution(problem(update_issue), 'Check internet connection and try updating again.').
solution(problem(update_issue), 'Roll back to the previous version or seek technical support for the update.').
% Add more solutions here

% Rules to diagnose problems based on symptoms
diagnose(Symptom, Problem, Solution) :-
    symptom(Problem, Symptom),
    solution(Problem, Solution).

% User interaction
help :-
    write('Welcome to the Help Desk System. Please describe your problem: '), nl,
    read(UserSymptom),
    diagnose(UserSymptom, Problem, Solution),
    format('Based on your symptom (~w), the issue might be ~w. Here is a suggested solution: ~w', [UserSymptom, Problem, Solution]),
    nl,
    write('Do you have another problem? (yes/no)'), nl,
    read(Response),
    handle_response(Response).

handle_response(yes) :-
    help.
handle_response(no) :-
    write('Thank you for using the Help Desk System. Goodbye!').
handle_response(_) :-
    write('Invalid response. Please enter "yes" or "no".'), nl,
    read(NewResponse),
    handle_response(NewResponse).