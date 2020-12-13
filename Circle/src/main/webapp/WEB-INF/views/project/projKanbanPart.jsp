
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
body {
	font-family: 'Roboto', Helvetica, sans-serif;
}

.app {
	display: flex;
	flex-flow: column;
	width: 100vw;
	height: 100vh;
}

header {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 60px;
}

.lists {
	display: flex;
	flex: 1;
	width: 100%;
	overflow-x: scroll;
}

.lists .list {
	display: flex;
	flex-flow: column;
	flex: 1;
	width: 100%;
	min-width: 250px;
	max-width: 350px;
	height: 100%;
	min-height: 150px;
	background-color: rgba(0, 0, 0, 0.1);
	margin: 0 15px;
	padding: 8px;
	transition: all 0.2s linear;
}

.lists .list .list-item {
	background-color: #F3F3F3;
	border-radius: 8px;
	padding: 15px 20px;
	text-align: center;
	margin: 4px 0px;
}
</style>





<div class="app">

	<c:forEach var="projKanbanHead" items="${projKanbanHead}">
		<h1>${projKanbanHead}</h1>
	</c:forEach>

	<div class="lists">
		<div class="list">
			<div>
				<label>해야할 업무</label>
			</div>
			<c:forEach var="projKanban" items="${projKanban}">
				<c:if test="${projKanban.prog_code eq 'PROG000001'}">
					<div class="list-item" draggable="true">
						<div>업무명 : ${projKanban.iss_title}</div>
						<div>담당자 : ${projKanban.emp_info_name}</div>
						<div>시작일 : ${projKanban.iss_sdate}</div>
						<div>종료일 : ${projKanban.iss_edate}</div>
						<div>업무 중요도 : ${projKanban.situ_title}</div>

					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="list">
			<label>진행 중 업무</label>
					<c:forEach var="projKanban" items="${projKanban}">
				<c:if test="${projKanban.prog_code eq 'PROG000001'}">
					<div class="list-item" draggable="true">
						<div>업무명 : ${projKanban.iss_title}</div>
						<div>담당자 : ${projKanban.emp_info_name}</div>
						<div>시작일 : ${projKanban.iss_sdate}</div>
						<div>종료일 : ${projKanban.iss_edate}</div>
						<div>업무 중요도 : ${projKanban.situ_title}</div>

					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="list">

			<div>
				<label> 완료한 업무 </label>
			</div>
					<c:forEach var="projKanban" items="${projKanban}">
				<c:if test="${projKanban.prog_code eq 'PROG000001'}">
					<div class="list-item" draggable="true">
						<div>업무명 : ${projKanban.iss_title}</div>
						<div>담당자 : ${projKanban.emp_info_name}</div>
						<div>시작일 : ${projKanban.iss_sdate}</div>
						<div>종료일 : ${projKanban.iss_edate}</div>
						<div>업무 중요도 : ${projKanban.situ_title}</div>

					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	const list_items = document.querySelectorAll('.list-item');
	const lists = document.querySelectorAll('.list');

	let draggedItem = null;

	for (let i = 0; i < list_items.length; i++) {
		const item = list_items[i];

		item.addEventListener('dragstart', function() {
			draggedItem = item;
			setTimeout(function() {
				item.style.display = 'none';
			}, 0)
		});

		item.addEventListener('dragend', function() {
			setTimeout(function() {
				draggedItem.style.display = 'block';
				draggedItem = null;
			}, 0);
		})

		for (let j = 0; j < lists.length; j++) {
			const list = lists[j];

			list.addEventListener('dragover', function(e) {
				e.preventDefault();
			});

			list.addEventListener('dragenter', function(e) {
				e.preventDefault();
				this.style.backgroundColor = 'rgba(0, 0, 0, 0.2)';
			});

			list.addEventListener('dragleave', function(e) {
				this.style.backgroundColor = 'rgba(0, 0, 0, 0.1)';
			});

			list.addEventListener('drop', function(e) {
				console.log('drop');
				this.append(draggedItem);
				this.style.backgroundColor = 'rgba(0, 0, 0, 0.1)';
			});
		}
	}
</script>