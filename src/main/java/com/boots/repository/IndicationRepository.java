package com.boots.repository;


import com.boots.entity.Indication;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IndicationRepository extends JpaRepository<Indication,Long> {
}
