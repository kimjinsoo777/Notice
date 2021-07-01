package notice.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import notice.service.NoticeService;
import notice.service.NoticeVO;

@Service("NoticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {
 
	@Resource(name = "NoticeDAO")
	private NoticeDAO noticeDAO;
	
	@Resource(name = "egovNttCodeGnrService")
	private EgovIdGnrService egovNttCodeGnrService;
	
	@Override
	public List<?> selectNoticeList(NoticeVO noticeVO) throws Exception {
	     return noticeDAO.selectNoticeList(noticeVO);
	     }
	
	@Override
	public void noticeWriteAction(NoticeVO noticeVO) throws Exception{
		int popupCode = egovNttCodeGnrService.getNextIntegerId();
		noticeVO.setBno(popupCode);
		
		noticeDAO.noticeWriteAction(noticeVO);
	} 
	
	@Override
	public EgovMap selectNoticeDetail(NoticeVO noticeVO) throws Exception{
		return noticeDAO.selectNoticeDetail(noticeVO);
	}
	
	@Override
	public void noticeDeleteAction(NoticeVO noticeVO) throws Exception{
		noticeDAO.noticeDeleteAction(noticeVO);
	}
	
	@Override
	public void noticeUpdateAction(NoticeVO noticeVO) throws Exception{
		noticeDAO.noticeUpdateAction(noticeVO);
	}

}
