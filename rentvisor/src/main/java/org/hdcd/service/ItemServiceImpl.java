package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Item;
import org.hdcd.mapper.ItemMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ItemServiceImpl implements ItemService {

	private final ItemMapper mapper;

	@Override
	public void register(Item item) throws Exception {
		mapper.create(item);
	}

	@Override
	public Item read(Long itemId) throws Exception {
		return mapper.read(itemId);
	}

	@Override
	public void modify(Item item) throws Exception {
		mapper.update(item);
	}

	@Override
	public void remove(Long itemId) throws Exception {
		mapper.delete(itemId);
	}

	@Override
	public List<Item> list(String category) throws Exception {
		return mapper.list(category);
	}

	@Override
	public String getPreview(Long itemId) throws Exception {
		return mapper.getPreview(itemId);
	}
	
	@Override
	public String getPicture(Long itemId) throws Exception {
		return mapper.getPicture(itemId);
	}
}
