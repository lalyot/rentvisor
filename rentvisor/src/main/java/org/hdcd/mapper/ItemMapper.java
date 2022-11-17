package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Item;

public interface ItemMapper {

	public void create(Item item) throws Exception;

	public Item read(Long itemId) throws Exception;

	public void update(Item item) throws Exception;

	public void delete(Long itemId) throws Exception;

	public List<Item> list(String category) throws Exception;

	public String getPicture(Long itemId) throws Exception;

	public String getPreview(Long itemId) throws Exception;

}
