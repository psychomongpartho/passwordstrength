#!/bin/bash
# password_strength.sh - Check the strength of a password.

# Function to check password strength
check_password_strength() {
  password="$1"

  # Check password length
  if [ ${#password} -lt 8 ]; then
    echo "Weak: Password is too short (less than 8 characters)"
    return
  fi

  # Check for the presence of numbers
  if ! [[ "$password" =~ [0-9] ]]; then
    echo "Weak: Password must contain at least one number"
    return
  fi

  # Check for the presence of special characters
  if ! [[ "$password" =~ [!@#\$%^*] ]]; then
    echo "Weak: Password must contain at least one special character (!@#\$%^&*)"
    return
  fi

  # Check for uppercase and lowercase letters
  if ! [[ "$password" =~ [a-z] && "$password" =~ [A-Z] ]]; then
    echo "Weak: Password must contain both uppercase and lowercase letters"
    return
  fi

  # If none of the above conditions are met, the password is strong
  echo "Strong: Password meets cybersecurity criteria"
}

# Prompt the user for input
echo "Please enter a password: "
read -r password

# Call the function to check password strength
check_password_strength "$password"
