package com.lifehub.auth.service;

import com.lifehub.auth.repository.UserRepository;
import com.lifehub.common.dto.RegisterRequest;
import com.lifehub.common.dto.UserResponse;
import com.lifehub.common.entity.UserEntity;
import com.lifehub.common.enums.Role;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;

    public UserResponse register(RegisterRequest request) {
        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new RuntimeException("Email already in use");
        }

        UserEntity user = UserEntity.builder()
                .fullName(request.getFullName())
                .email(request.getEmail())
                .password(request.getPassword()) // You can add encryption here
                .role(Role.USER)
                .build();

        UserEntity saved = userRepository.save(user);

        return UserResponse.builder()
                .id(saved.getId())
                .email(saved.getEmail())
                .fullName(saved.getFullName())
                .role(saved.getRole())
                .build();
    }
}

