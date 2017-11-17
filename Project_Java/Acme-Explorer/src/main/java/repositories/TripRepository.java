
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Trip;

@Repository
public interface TripRepository extends JpaRepository<Trip, Integer> {

	//Devolvemos todos los viajes PARA CUALQUIERA que NO esté autenticado y
	//que no estén cancelados y además tenga fecha de publicación.
	//Requisito 10.2
	@Query("select t from Trip t where t.publicationDate!=null and t.cancelled=false and t.startDate >CURRENT_TIMESTAMP")
	Collection<Trip> findAllTripsNoAuthenticate();

	//Requisito 12.1
	@Query("select t from Trip t where t.publicationDate=null")
	Collection<Trip> findAllTripsNotPublished();

	//Requisito 12.3
	@Query(" select t from Trip t where t.publicationDate!=null and t.startDate>CURRENT_TIMESTAMP")
	Collection<Trip> findAllTripsPublishedNotStarted();

	//Requisito 13.4
	@Query("select a.trip from ApplicationFor a where a.trip.startDate > now() and a.status='ACCEPTED'")
	Collection<Trip> findTripsWhitStatusAcceptedNotStarted();

	//Requisito de información C/6.
	@Query("select a.trip from ApplicationFor a where a.explorer.id=?1")
	Collection<Trip> findAllTripsApplyByExplorerId(int explorerId);

	//Requisito de Información B/10.
	@Query("select a.trip from AuditRecord a where a.auditor=?1")
	Collection<Trip> findByAuditorId(int auditorId);

	//Suma todos los precios con iva de las stages de la trip pasada como parámetro.
	@Query("select sum(c.totalPrice) from Trip r join r.stages c where r.id=?1")
	Double findPrice(int tripId);

	@Query("select c.trips from Category c where c.id=?1")
	Collection<Trip> findAllTripsByCategoryId(int categoryId);
}
