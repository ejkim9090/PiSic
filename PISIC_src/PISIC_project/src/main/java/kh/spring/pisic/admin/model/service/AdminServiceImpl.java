package kh.spring.pisic.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.admin.model.dao.AdminDao;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao dao;
	
	@Override
	public List<Artist> selectArtistList() {
		return dao.selectArtistList();
	}

	@Override
	public Artist selectArtist(String artist_no) {
		return dao.selectArtist(artist_no);
	}

	@Override
	public List<Artist> selectArtistAjax(String keyword) {
		return dao.selectArtistAjax(keyword);
	}

	@Override
	public int insertArtist(Artist artist) {
		return dao.insertArtist(artist);
	}
	
	@Override
	public int updateArtist(Artist artist) {
		return dao.updateArtist(artist);
	}

	@Override
	public int deleteArtist(List<Artist> aritstList) {
		return dao.deleteArtist(aritstList);
	}
	
	// 앨범 목록 조회
	@Override
	public List<Album> selectAlbumList() {
		return dao.selectAlbumList();
	}

	// 앨범 검색
	@Override
	public List<Album> selectSearchAlbumList(String keyword) {
		return dao.selectSearchAlbumList(keyword);
	}

	// 앨범 추가하기
	@Override
	public int insertAlbum(Album album) {
		return dao.insertAlbum(album);
	}

	// 앨범 수정하기 - 앨범 조회
	@Override
	public Album selectAlbum(int a_no) {
		return dao.selectAlbum(a_no);
	}

	// 앨범 정보 수정
	@Override
	public int updateAlbum(Album album) {
		return dao.updateAlbum(album);
	}

	// 앨범 삭제
	@Override
	public int deleteAlbum(List<Album> albumList) {
		return dao.deleteAlbum(albumList);
	}

	// 곡 목록 조회
	@Override
	public List<Sound> selectSoundList() {
		return dao.selectSoundList();
	}

}
