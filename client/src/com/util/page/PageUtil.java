package com.util.page;

public class PageUtil {
	private int pageSize;// ÿҳ��ʾ������
	private int recordCount;// �ܹ�������
	private int currentPage;// ��ǰҳ��

	public PageUtil(int pageSize, int recordCount, int currentPage) {
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		setCurrentPage(currentPage);
	}

	// ���췽��
	public PageUtil(int pageSize, int recordCount) {
		this(pageSize, recordCount, 1);
	}

	// ��ҳ��
	public int getPageCount() {
		int size = recordCount / pageSize;// ������/ÿҳ��ʾ������=��ҳ��
		int mod = recordCount % pageSize;// ���һҳ������
		if (mod != 0)
			size++;
		return recordCount == 0 ? 1 : size;
	}

	// ��������ʼ����Ϊ0
	public int getFromIndex() {
		// System.out.println("from index:"+(currentPage-1) * pageSize);
		return (currentPage - 1) * pageSize;
	}

	// ������
	public int getToIndex() {
		// System.out.println("to index:"+Math.min(recordCount, currentPage *
		// pageSize));
		return Math.min(recordCount, currentPage * pageSize);
	}

	// �õ���ǰҳ
	public int getCurrentPage() {
		return currentPage;
	}// ���õ�ǰҳ

	public void setCurrentPage(int currentPage) {
		int validPage = currentPage <= 0 ? 1 : currentPage;
		validPage = validPage > getPageCount() ? getPageCount() : validPage;
		this.currentPage = validPage;
	}// �õ�ÿҳ��ʾ������

	public int getPageSize() {
		return pageSize;
	}// ����ÿҳ��ʾ������

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}// �õ��ܹ�������

	public int getRecordCount() {
		return recordCount;
	}// �����ܹ�������

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

}
