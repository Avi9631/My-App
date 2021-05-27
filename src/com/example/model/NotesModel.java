package com.example.model;

public class NotesModel {
	private int noteId;
	private String noteName;
	private String noteCategory;
	private String noteStartDate;
	private String noteEndDate;
	public NotesModel(int noteId, String noteName, String noteCategory, String noteStartDate, String noteEndDate) {
		this.noteId = noteId;
		this.noteName = noteName;
		this.noteCategory = noteCategory;
		this.noteStartDate = noteStartDate;
		this.noteEndDate = noteEndDate;
	}
	public int getNoteId() {
		return noteId;
	}
	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}
	public String getNoteName() {
		return noteName;
	}
	public void setNoteName(String noteName) {
		this.noteName = noteName;
	}
	public String getNoteCategory() {
		return noteCategory;
	}
	public void setNoteCategory(String noteCategory) {
		this.noteCategory = noteCategory;
	}
	public String getNoteStartDate() {
		return noteStartDate;
	}
	public void setNoteStartDate(String noteStartDate) {
		this.noteStartDate = noteStartDate;
	}
	public String getNoteEndDate() {
		return noteEndDate;
	}
	public void setNoteEndDate(String noteEndDate) {
		this.noteEndDate = noteEndDate;
	}
	
	
}
