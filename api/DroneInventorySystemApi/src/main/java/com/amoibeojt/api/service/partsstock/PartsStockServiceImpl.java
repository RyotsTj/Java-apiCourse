package com.amoibeojt.api.service.partsstock;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.amoibeojt.api.dto.partsstock.PartsStockResponseDTO;
import com.amoibeojt.api.dto.partsstock.PartsStockSearchDTO;
import com.amoibeojt.api.entity.PartsStock;
import com.amoibeojt.api.repository.PartsStockRepository;

import lombok.RequiredArgsConstructor;

/**
 * 部品在庫照会のサービスの実装クラス（DTO にマッピング）
 * 
 * @author your name
 */

@Service
@RequiredArgsConstructor
public class PartsStockServiceImpl implements PartsStockService {

    private final PartsStockRepository repository;

    @Override
    public List<PartsStockResponseDTO> search(PartsStockSearchDTO c) {
    	
        // エンティティからDTOへ変換
        List<PartsStock> entity = repository.searchByCriteria(c);
        return entity.stream()
            .map(this::toDto)
            .collect(Collectors.toList());
    }

    private PartsStockResponseDTO toDto(PartsStock e) {
        return PartsStockResponseDTO.builder()
            .centerId(    e.getCenterId())
            .categoryId(  e.getCategoryId())
            .stockId(     e.getStockId())
            .name(        e.getName())
            .amount(      e.getAmount())
            .description( e.getDescription())
            .createDate(  e.getCreateDate())
            .updateDate(  e.getUpdateDate())
            .build();
    }
}
