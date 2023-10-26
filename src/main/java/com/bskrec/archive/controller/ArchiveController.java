package com.bskrec.archive.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ArchiveController {
	public ResponseEntity addPlayerArchive(@RequestParam Map<String,Object> archiveMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity playerArchiveImport(@RequestBody Map<String,String> gameDataMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity playerList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView gameCodePopup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity awayTeamSearch(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ResponseEntity homeTeamSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity teamArchiveSubmit(@RequestParam Map<String, Object> archiveMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity gameCodeSearch(@RequestBody Map<String,Object> gameDataMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modPlayerArchive(@RequestParam Map<String,Object> gameDataMap, HttpServletRequest reqeust, HttpServletResponse response) throws Exception;
	public ModelAndView teamArchivePopup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity teamArchiveGameDate(@RequestBody Map<String,Object> gameData, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modTeamArchive(@RequestParam Map<String,Object> gameDataMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
