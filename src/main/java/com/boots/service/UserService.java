package com.boots.service;

import com.boots.entity.Indication;
import com.boots.entity.Role;
import com.boots.entity.User;
import com.boots.repository.IndicationRepository;
import com.boots.repository.RoleRepository;
import com.boots.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class UserService implements UserDetailsService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    IndicationRepository indicationRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return user;
    }

    public User findUserById(Long userId) {
        Optional<User> userFromDb = userRepository.findById(userId);
        return userFromDb.orElse(new User());
    }

    public List<User> allUsers() {
        return userRepository.findAll();
    }

    public boolean saveUser(User user) {
        User userFromDB = userRepository.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return true;
    }

    public boolean deleteUser(Long userId) {
        if (userRepository.findById(userId).isPresent()) {
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    public List<User> usergtList(Long idMin) {
        return em.createQuery("SELECT u FROM User u WHERE u.id > :paramId", User.class)
                .setParameter("paramId", idMin).getResultList();
    }

    public List<Indication> allIndication(){
        return indicationRepository.findAll();
    }

    public Integer getLastIndication(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();
        Integer lastIndication = 0;
        Indication lastInd;
        for (int i = allIndication().size() - 1; i > 0; i--) {
            lastInd = allIndication().get(i);
            if (lastInd.getUsers().getId().equals(currentUser.getId())) {
                lastIndication = lastInd.getIndication();
                break;
            }
        }
        return lastIndication;
    }

    public String getLastSendDate(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();

        String lastSendDate = "Вы не отправляли данные";
        Indication lastInd;
        for (int i = allIndication().size() - 1; i > 0; i--) {
            lastInd = allIndication().get(i);
            if (lastInd.getUsers().getId().equals(currentUser.getId())) {
                lastSendDate = lastInd.getSendDate();
                break;
            }
        }
        return lastSendDate;
    }

    public void saveIndication(Indication indication){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User)authentication.getPrincipal();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

        indication.setSendDate(formatter.format(new Date()));
        indication.setIndication(indication.getIndication());
        indication.setUsers(currentUser);

        indicationRepository.save(indication);
    }


    public Set<Indication> findIndication(String username){
        User user = userRepository.findByUsername(username);
        if (user == null) {
            Set<Indication> falseSet = new HashSet<Indication>();
            return falseSet;
        }
        return user.getIndications();
    }







}
