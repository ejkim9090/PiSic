package kh.spring.pisic.mymusic.model.service;

import java.util.List;

import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.sound.domain.Sound;

public interface MyMusicService {
	
	public List<MyMusic> selectPlaylist(String m_id);
	public int insertSound(List<Sound> soundList);
}